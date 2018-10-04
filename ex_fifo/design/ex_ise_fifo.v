`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:24 09/09/2018 
// Design Name: 
// Module Name:    ex_ise_fifo 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ex_ise_fifo(
    input wire sclk,
    input wire rst_n,
    input wire [7:0]data_in,
    input wire data_v,
    input wire r_flag,
    output wire [7:0] dout,
    output prog_full,
    output prog_empty
    
    );

wire  w_full;
wire  r_empty;
wire  wr_en;
wire  rd_en;
wire  almost_full;
wire  wr_ack;
wire  overflow;
wire  almost_empty;
wire  valid;
wire  underflow;

 

assign rd_en =( (r_empty==1'b0) && (r_flag==1'b1) );
//assign rd_en = (r_flag==1'b1) ;
assign wr_en =( (w_full==1'b0 ) && (data_v==1'b1) );
//assign wr_en = (data_v==1'b1);

sync_fifo_8x256 sync_fifo (
  .clk(sclk), // input clk
  .rst(!rst_n), // input rst
  .din(data_in), // input [7 : 0] din
  .wr_en(wr_en), // input wr_en
  .rd_en(rd_en), // input rd_en
  .dout(dout), // output [7 : 0] dout
  .full(w_full), // output full
  .almost_full(almost_full), // output almost_full
  .wr_ack(wr_ack), // output wr_ack
  .overflow(overflow), // output overflow
  .empty(r_empty), // output empty
  .almost_empty(almost_empty), // output almost_empty
  .valid(valid), // output valid
  .underflow(underflow), // output underflow
  .prog_full(prog_full),
  .prog_empty(prog_empty)
);

endmodule
