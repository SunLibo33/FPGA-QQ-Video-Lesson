`timescale 1ns/100ps
module tb_ex_mult();

reg tb_sclk;
reg tb_rst_n;
reg [15:0]tb_in_a;
reg [15:0]tb_in_b;
wire [31:0] tb_out_rslt;
wire [7:0]remain_sig;

initial 
  begin
    tb_rst_n = 1'b0;
	tb_sclk  = 1'b0;
    #100
	gen_data();
  end

always #10  tb_sclk=~tb_sclk; 
  
ex_mult ex_mult_instance(
       .sclk     (tb_sclk),
	   .rst_n    (tb_rst_n),
	   .in_a     (tb_in_a),
	   .in_b     (tb_in_b),
	   .out_rslt (tb_out_rslt),
	   .remain_sig(remain_sig)
);

task gen_data();
     integer i,data_tmp;
	 begin
	   for(i=0;i<256;i=i+1)
	   begin
	     @(posedge tb_sclk);
		 data_tmp={$random}%32768;
		 tb_in_a=data_tmp;
		 tb_in_b=data_tmp;
	   end
	 end

endtask

endmodule

