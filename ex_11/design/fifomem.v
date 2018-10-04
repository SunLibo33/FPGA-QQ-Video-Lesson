module fifomem(
       input wire w_clk,
       input wire r_clk,
       input wire w_en,
       input wire w_full,
       input wire [7:0]w_data,
       input wire [7:0]w_addr,
       input wire      r_empty,
       input wire [7:0]r_addr,
       output wire[7:0]r_data
       
);

wire ram_w_en;
assign ram_w_en=( (w_en==1'b1)&&(w_full==1'b0) );

dp_ram_256x8_swsr	dp_ram_256x8_swsr_inst (

  .wrclock ( w_clk ),
  .wren ( ram_w_en ),
  .wraddress ( w_addr ),
	.data ( w_data ),
	
	.rdclock ( r_clk ),
	.rdaddress ( r_addr ),
	.q ( r_data )
	);



endmodule