virtual class base_class;
	pure virtual function interger send(int data); // No implementation
endclass

class child extends base_class;
	virtual function interger send(int data);
		// body of the function

	endfunction
endclass

