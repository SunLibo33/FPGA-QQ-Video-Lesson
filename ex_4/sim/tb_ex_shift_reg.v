`timescale 1ns/100ps
module tb_ex_shift_reg();

reg tb_lvds_clk;
reg tb_rst_n;
reg tb_lvds_d;
wire [7:0] tb_o_lvds_d;
reg  [3:0] i_30;

reg [0:0] mem1x16 [15:0];

initial begin
  tb_lvds_clk <= 1'b0;
  tb_rst_n    <= 1'b0;
  tb_lvds_d   <= 1'b0;
  #90.1
  tb_rst_n    <= 1'b1;
end

always #10 tb_lvds_clk <= ~tb_lvds_clk;

initial begin
   $readmemb("./data.txt",mem1x16);
end

initial begin
        #100
        lvds_send_d();
end

ex_shift_reg ex_shift_reg_inst(
             .lvds_clk (tb_lvds_clk),
			 .rst_n    (tb_rst_n),
			 .lvds_d   (tb_lvds_d),
			 .o_lvds_d (tb_o_lvds_d)
);

task lvds_send_d();
     integer i;
	 begin
	   for(i=0;i<256;i=i+1)
	   begin
	   @(posedge tb_lvds_clk);
	     tb_lvds_d <= mem1x16[i[3:0]];
		 i_30<=i[3:0];
	   end
	 end
endtask

endmodule