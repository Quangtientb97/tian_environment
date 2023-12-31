//
//Revision:    $Revision: 1506 $
//Date:        $Date: 2009-04-25 23:51:56 -0700 (Sat, 25 Apr 2009) $
//
//Copyright (c) 2008, 2009 The SPIRIT Consortium.
//
//This work forms part of a deliverable of The SPIRIT Consortium.
//
//Use of these materials are governed by the legal terms and conditions
//outlined in the disclaimer available from www.spiritconsortium.org.
//
//This source file is provided on an AS IS basis.  The SPIRIT
//Consortium disclaims any warranty express or implied including
//any warranty of merchantability and fitness for use for a
//particular purpose.
//
//The user of the source file shall indemnify and hold The SPIRIT
//Consortium and its members harmless from any damages or liability.
//Users are requested to provide feedback to The SPIRIT Consortium
//using either mailto:feedback@lists.spiritconsortium.org or the forms at 
//http://www.spiritconsortium.org/about/contact_us/
//
//This file may be copied, and distributed, with or without
//modifications; but this notice must be included on any copy.


#ifndef _SCMLADAPTOR_H_
#define _SCMLADAPTOR_H_

#include <systemc.h>
#include "scml.h"
#include "PV/PV.h"
#include "pv_slave_base.h"
#include "pv_target_port.h"
#include "user_types.h"

class scmlAdaptor : 
  public sc_module,
  public pv_slave_base< ADDRESS_TYPE , DATA_TYPE >
{
public:
  SC_HAS_PROCESS(scmlAdaptor);
  scmlAdaptor( sc_module_name module_name );
  ~scmlAdaptor();

  pv_target_port<ADDRESS_TYPE,DATA_TYPE>    apb_slave_port;
  PVInitiator_port<DATA_TYPE, ADDRESS_TYPE>   scml_master_port; 

  tlm::tlm_status write( const ADDRESS_TYPE &addr , const DATA_TYPE &data,
			 const unsigned int byte_enable = tlm::NO_BE,
			 const tlm::tlm_mode mode = tlm::REGULAR,
			 const unsigned int export_id = 0 );
  tlm::tlm_status read( const ADDRESS_TYPE &addr , DATA_TYPE &data,
			const unsigned int byte_enable = tlm::NO_BE,
			const tlm::tlm_mode mode = tlm::REGULAR,
			const unsigned int export_id = 0 );
  
private:
  void end_of_elaboration();
};

#endif
