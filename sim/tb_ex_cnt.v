`timescale 1ns/100ps

module tb_ex_cnt();

       reg tb_sclk,tb_rst_n;
	   wire [9:0] tb_cnt;
	   
	   initial 
	   begin
         tb_sclk  <= 1'b0;
		 tb_rst_n <= 1'b0;
 	     #200.1
		 tb_rst_n <= 1'b1;	 
	   end
	   
always #10 tb_sclk <= ~tb_sclk;

ex_cnt ex_cnt_inst(

.sclk(tb_sclk),
.rst_n(tb_rst_n),
.cnt(tb_cnt)
);


endmodule 