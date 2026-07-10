class parent_trans; //parent transaction class
  bit [31:0] data; // parent class property
  
  function void disp_p (); //void disp funct returns nothing
    $display("the value of data = %0h", data);//display data
  endfunction //endfunction
endclass // that's all were doing in this class

class child_trans extends parent_trans; //child class extends the parent class's properties and methods from the class above.
  
  int id; //child's class property 
  
  function void disp_c(); //another void display function
    $display("the value of data = %0h", id); //disp id
  endfunction //that's it end function
endclass //that's all end class.

module class_inheritance; //this is our tb module
 
  initial begin //intial begin kickstarts the simulation
  child_trans c_tran; //handle
    parent_trans p_tran; // handle
    p_tran = new(); // object creation via new constructor 
    c_tran = new(); // object creation via new constructor
    c_tran.id = 10; // set the value of id to ten with the handle_name_.notation
    c_tran.data = 10001;
    c_tran.disp_p();
    c_tran.disp_c();
    p_tran.data = 10111;
    p_tran.disp_p();
  end
endmodule


