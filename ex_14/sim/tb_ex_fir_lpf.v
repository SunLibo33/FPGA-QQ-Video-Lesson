`timescale 1ns/100ps

module tb_ex_fir_lpf();

reg tb_sclk;
reg tb_rst_n;
wire [20:0]tb_lpf_wave;

initial 
  begin
    tb_sclk=1'b0;
	tb_rst_n=1'b0;
	#100
	tb_rst_n=1'b1;
  end
  
always #10 tb_sclk=~tb_sclk;

top_fir_lpf top_fir_lpf_instance(
       .sclk     (tb_sclk),
	   .rst_n    (tb_rst_n),
	   .lpf_wave (tb_lpf_wave)
       
);

endmodule
