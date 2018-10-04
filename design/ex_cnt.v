module ex_cnt(
       input wire         sclk,
	   input wire         rst_n,
	   output wire   [9:0] cnt
);

reg [9:0] cnt_r;

assign cnt = cnt_r;

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    cnt_r <= 10'b00_0000_0000;
  else
    cnt_r <= cnt_r + 10'b00_0000_0001;
end


endmodule