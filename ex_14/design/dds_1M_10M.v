module dds_1M_10M(
	   input wire sclk,
	   input wire rst_n,
	   output wire [7:0]o_wave
);

parameter FRQ_W_1M =32'd85899346;
parameter FRQ_W_10M=32'd858993459;

reg[31:0] addr_1M; 
reg[31:0] addr_10M;

wire [7:0]o_wave_1M;
wire [7:0]o_wave_10M;
wire [8:0]wave_1M_10M;
 

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    addr_1M<=32'd0;
  else
    addr_1M<=addr_1M+FRQ_W_1M;
end	 

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    addr_10M<=32'd0;
  else
    addr_10M<=addr_10M+FRQ_W_10M;
end	 

  sp_ram_256x8	sp_ram_256x8_inst_1M (
	.address ( addr_1M[31:24] ),
	.clock ( sclk ),
	.data ( 8'h00 ),
	.wren ( 1'b0 ),
	.q ( o_wave_1M )
	);
	
  sp_ram_256x8	sp_ram_256x8_inst_10M (
	.address ( addr_10M[31:24] ),
	.clock ( sclk ),
	.data ( 8'h00 ),
	.wren ( 1'b0 ),
	.q ( o_wave_10M )
	);

assign wave_1M_10M={o_wave_1M[7],o_wave_1M}+{o_wave_10M[7],o_wave_10M};
assign o_wave=wave_1M_10M[8:1];

	
endmodule