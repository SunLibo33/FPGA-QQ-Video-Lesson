module ex_dds(
	   input wire sclk,
	   input wire rst_n,
	   output wire [7:0]o_wave
);

parameter FRQ_W=32'd85899346;
parameter FRQ_ADD=32'd85899346/10;
parameter INIT_PHASE=32'h8000_0000;
reg[31:0] addr;
reg[31:0] frq_word;
reg[6:0]  div_cnt;
reg       div_flag;


always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    div_cnt<=7'd0;
  else if(div_cnt==7'd99)
    div_cnt<=7'd0;
  else	
    div_cnt<=div_cnt+7'd1;
end	 

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    div_flag<=1'b0;
  else if(div_cnt==7'd99)
    div_flag<=1'b1;
  else
    div_flag<=1'b0;
	
end	 

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    frq_word<=FRQ_W;
  else if(div_flag==1'b1)
    frq_word<=frq_word+FRQ_ADD;
end	 

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    addr<=INIT_PHASE;
  else
    addr<=addr+frq_word;
end	 

  sp_ram_256x8	sp_ram_256x8_inst (
	.address ( addr[31:24] ),
	.clock ( sclk ),
	.data ( 8'h00 ),
	.wren ( 1'b0 ),
	.q ( o_wave )
	);

	   
endmodule