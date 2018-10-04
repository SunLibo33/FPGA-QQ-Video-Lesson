module ex_ipcore(
       input wire clk,
		 output wire oclk1,
		 output wire oclk2,
		 output reg  [1:0]cnt,
		 output wire [7:0]odata,
		 output wire locked
);

reg [7:0]raddr=0;

always @(posedge oclk1 or negedge locked)
begin
  if(locked==1'b0)
    raddr<=8'h00;
  else
    raddr<=raddr+8'h01; 
end

always @(posedge oclk1 or negedge locked)
begin
  if(locked==1'b0)
    cnt<=2'b00;
  else
    cnt<=cnt+2'b01; 
end

pll1	pll1_inst (
	.inclk0 ( clk ),
	.c0 ( oclk1 ),
	.c1 ( oclk2 ),
	.locked ( locked )
	);

rom_8x256	rom_8x256_inst (
	.address ( raddr ),
	.clock ( oclk1 ),
	.q ( odata )
	);

	
endmodule 