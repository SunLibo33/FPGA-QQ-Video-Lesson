`timescale 1ns/100ps
module tb_cic_top();

reg tb_sclk;
reg tb_rst_n;

initial 
  begin
  	tb_sclk=1'b0;
	  tb_rst_n=1'b0;
	  #100
	  tb_rst_n=1'b1;
  end
  
always #10 tb_sclk=~tb_sclk;

cic_top cic_top_instance(
       .sclk  (tb_sclk),
       .rst_n (tb_rst_n)
       );

endmodule
