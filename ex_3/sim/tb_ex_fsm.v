`timescale 1ns/100ps

module tb_ex_fsm();
      
reg  tb_sclk;
reg  tb_rst_n;
reg  tb_A;
wire tb_k1;
wire tb_k2;
	   
initial begin
    tb_sclk   <= 1'b0;
	tb_rst_n  <= 1'b0;
	#100;
    tb_rst_n  <= 1'b1;
end

initial begin
 #200;
 in_data();
end

always #10 tb_sclk <= ~tb_sclk;

ex_fsm ex_fsm_instance(
.sclk(tb_sclk),
.rst_n(tb_rst_n),
.A(tb_A),
.k1(tb_k1),
.k2(tb_k2)
);
	   
task in_data();
     integer i;
	 begin
	   for(i=0;i<1024;i=i+1)
	   begin
	     @(posedge tb_sclk);
		   if(i<50)
		     tb_A <= 1'b0;
           else if(i<200)	
             tb_A <= 1'b1;	
           else if(i<700)	
             tb_A <= 1'b0;
           else if(i<800)	
             tb_A <= 1'b1;	
           else if(i<900)	
             tb_A <= 1'b0;				 
        end			 
	 end
endtask
		
	   
endmodule