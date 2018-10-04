`timescale  1ns/100ps

module tb_ex_ipcore();

reg tb_clk;
wire tb_oclk1;
wire tb_oclk2;
wire tb_locked;
wire [1:0] tb_cnt;
wire [7:0] tb_odata;


 
 
 

initial 
begin
tb_clk<=1'b0;
end

always #10 tb_clk =~tb_clk;

ex_ipcore ex_ipcore_instance(
          .clk(tb_clk),
		  .oclk1(tb_oclk1),
		  .oclk2(tb_oclk2),
		  .cnt(tb_cnt),
		  .odata(tb_odata),
		  .locked(tb_locked)
);

endmodule 