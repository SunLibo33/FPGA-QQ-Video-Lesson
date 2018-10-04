module ex_dds(
	   input wire sclk,
	   input wire rst_n,
	   output wire [15:0]o_wave
);

parameter FRQ_W_1K =32'd85899;
parameter FRQ_W_10K=32'd858993;

reg[31:0] addr_1K; 
reg[31:0] addr_10K;
reg[22:0] sum;
reg[14:0] sum_cnt;
reg       sum_flag;

wire [7:0]o_wave_1K;
wire [7:0]o_wave_10K;

reg [22:0]sum_reg;

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    sum_cnt<=15'd0;
  else if(sum_cnt==15'd29999)
    sum_cnt<=15'd0;
  else 
    sum_cnt<=sum_cnt+15'd1;
end	 

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    sum_flag<=1'b0;
  else if(sum_cnt==15'd29999)
    sum_flag<=1'b1;
  else 
    sum_flag<=1'b0;
end	 

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    sum<=23'd0;
  else if(sum_flag==1'b1)
    sum<={{15{o_wave_1K[7]}},o_wave_1K};
  else 
    sum<=sum+{{15{o_wave_1K[7]}},o_wave_1K};
end	

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    sum_reg<=23'd0;
  else if(sum_flag==1'b1)
    sum_reg<=sum;
end	
 

mult_8x8_l0	mult_8x8_l0_inst (
	.dataa ( o_wave_1K ),
	.datab ( o_wave_10K ),
	.result ( o_wave )
	);


always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    addr_1K<=32'd0;
  else
    addr_1K<=addr_1K+FRQ_W_1K;
end	 

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    addr_10K<=32'd0;
  else
    addr_10K<=addr_10K+FRQ_W_10K;
end	 

  sp_ram_256x8	sp_ram_256x8_inst_1K (
	.address ( addr_1K[31:24] ),
	.clock ( sclk ),
	.data ( 8'h00 ),
	.wren ( 1'b0 ),
	.q ( o_wave_1K )
	);
	
  sp_ram_256x8	sp_ram_256x8_inst_10K (
	.address ( addr_10K[31:24] ),
	.clock ( sclk ),
	.data ( 8'h00 ),
	.wren ( 1'b0 ),
	.q ( o_wave_10K )
	);

	   
endmodule