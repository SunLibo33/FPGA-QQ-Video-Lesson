`timescale 1ns/100ps
module tb_ex_dds ();

reg tb_sclk;
reg tb_rst_n;
wire [7:0]tb_o_wave;

ex_dds ex_dds_instance(
	   .sclk    (tb_sclk),
	   .rst_n   (tb_rst_n),
	   .o_wave  (tb_o_wave)
);

initial
  begin
    tb_sclk=1'b0;
	tb_rst_n=1'b0;
	#100
	tb_rst_n=1'b1;
  end
  
always #10 tb_sclk=~tb_sclk;

endmodule 
