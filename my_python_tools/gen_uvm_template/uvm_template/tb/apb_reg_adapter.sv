`ifndef __APB_REG_ADAPTER__
`define __APB_REG_ADAPTER__

// --------------------------------------- 
// The class should be handled in tb_c   
// ---------------------------------------
// In tb_c
// |-- Properties
//   	 spi_slv_reg_blk                                     _reg_model ;
//   	 spi_slv_reg_adapter                                 _adapter   ;
//   	 uvm_reg_predictor#(    vip_apb_mstr_trans    )      _predictor ;
//								   <uvm_sequence_item type> : Use for detect bus2reg
// |-- Build phase
// 	 handle class
//     _reg_model.build();
//     _reg_model.lock_model();
//     _reg_model.set_hdl_path_root("$root.spi_slv_top._spi_slv.apbctrl");
// |-- Connect phase
//     _reg_model.default_map.set_sequencer(_apb_mstr_agent._seqr, _adapter);
//     _reg_model.default_map.set_auto_predict(0);
//     _predictor.map      = _reg_model.default_map;
//     _predictor.adapter  = _adapter;
//     _agent._trans_ap.connect(_predictor.bus_in);
class apb_reg_adapter extends uvm_reg_adapter;
	// Declare transaction
	apb_transaction_c apb_trans;

	//Get environment configuaration if exist
	apb_system_configuration p_cfg=new("p_cfg");

	// UVM Field Macros
	`uvm_object_utils_begin(apb_reg_adapter)
	`uvm_field_object(apb_trans , UVM_ALL_ON);
	`uvm_field_object(p_cfg         , UVM_ALL_ON);
	`uvm_object_utils_end

	//	CONSTUCTOR: Create a new transaction instance, passing the appropriate argument
	extern function new(string name= "apb_reg_adapter");

	//	Convert a UVM RAL transaction into an APB transaction
	extern virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);

	//	Convert APB transaction back to into a UVM RAL transaction
	extern virtual function void bus2reg(
		uvm_sequence_item bus_item,
		ref uvm_reg_bus_op rw
	);
endclass

// -----------------------------------------------------------------------------
function uvm_sequence_item apb_reg_adapter::reg2bus(const ref uvm_reg_bus_op rw);
	bit [31:0] burst_size_e;

	`uvm_info("apb_reg_adapter::reg2bus", "Entered ...",UVM_HIGH);

	apb_trans = apb_transaction_c::type_id::create("apb_trans");
	apb_trans.cfg = p_cfg;

	if (rw.n_bits > p_cfg.pdata_width)
		`uvm_fatal("apb_reg_adapter::reg2bus", 
			"Transfer requested with a data width greater than the configured system data width. 
			Please reconfigure the system with the appropriate data width or reduce the data size");

	`uvm_info("apb_reg_adapter::reg2bus", $psprintf("n_bits data = %b log_base_2 n_bits", rw.n_bits), UVM_HIGH);

	if (!apb_trans.randomize() with {
		apb_trans.xact_type == (rw.kind == UVM_WRITE) ? apb_transaction_c::WRITE : apb_transaction_c::READ;
		apb_trans.address == rw.addr;
	}) `uvm_fatal("apb_reg_adapter::reg2bus", "Transaction randomization failed");

	// Collect generic data and send it to bus.
	if(rw.kind == UVM_WRITE) begin
		apb_trans.data = rw.data;
	end

	`uvm_info("apb_reg_adapter::reg2bus", "Exiting ...",UVM_HIGH);

	return apb_trans;

endfunction : reg2bus


// -----------------------------------------------------------------------------
// Function: bus2reg
// |-- Receive bus_item from monitor and converts to uvm_reg
// -----------------------------------------------------------------------------
function void apb_reg_adapter::bus2reg(
	uvm_sequence_item bus_item,
	ref uvm_reg_bus_op rw
);
	apb_transaction_c bus_trans;

	`uvm_info("apb_reg_adapter::bus2reg", "Entering ...",UVM_HIGH);

	if (!$cast(bus_trans, bus_item)) begin
		`uvm_fatal("apb_reg_adapter::bus2reg", "NOT_APB_TYPE : Provided bus_item is not of the correct type")
		return;
	end

	if (bus_trans != null) begin
		// assign apb system congigursation
		bus_trans.cfg = p_cfg;
		`uvm_info("apb_reg_adapter::bus2reg", $psprintf("printing bus_trans %0s", bus_trans.sprint()), UVM_HIGH);
		rw.addr = bus_trans.address;
		rw.data = bus_trans.data;

		if (bus_trans.xact_type == apb_transaction_c::READ) begin
			rw.kind = UVM_READ; 
			`uvm_info("apb_reg_adapter::bus2reg" , $psprintf("bus_trans.data = %0h (READ)", bus_trans.data),UVM_HIGH);
		end
		else if(bus_trans.xact_type == apb_transaction_c::WRITE) begin
			rw.kind = UVM_WRITE; 
		end 

		//
		//	Update the result of the transaction.
		//	Update the "uvm_reg_bus_op.status" to UVM_IS_OK only if pslverr_enable=0 when apb3_enable=1 or apb4_enable=1
		//	and when its only apb2 i.e. when ap3_enabl=0 and ap4_enable=0, set always "uvm_reg_bus_op.status" to UVM_IS_OK
		//	else make it UVM_NOT_OK
		//
		if (bus_trans.cfg.apb3_enable == 1 || bus_trans.cfg.apb4_enable == 1) begin
			if(bus_trans.pslverr_enable == 0)
				rw.status = UVM_IS_OK;
			else
				rw.status  = UVM_NOT_OK;
		end
		else
			rw.status = UVM_IS_OK;
	end
	else
		rw.status  = UVM_NOT_OK;

	`uvm_info("apb_reg_adapter::bus2reg", "Exiting ...",UVM_HIGH);
endfunction


`endif // __APB_REG_ADAPTER__
