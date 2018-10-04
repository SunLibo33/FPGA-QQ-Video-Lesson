module ex_wire(
       input wire sel,
	   input wire a,
	   input wire b,
	   output wire c
);

assign c = sel ? a : b ;
//assign c = (sel == 1'b1) ? a : b ;

/* always @(sel or a or b)
begin 
  if(sel == 1'b1)
    c = a;
  else
    c = b;  
end  */

//at the same time , we should change the output wire c to out reg c

/* always @(sel or a or b)
begin 
  if(sel)
    c = a;
  else
    c = b;
end  */

endmodule