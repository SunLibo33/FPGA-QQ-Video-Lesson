module ex_shift_reg(
       input wire lvds_clk,
	   input wire rst_n,
	   input wire lvds_d,
	   output reg [7:0] o_lvds_d
);

reg [7:0] shift_reg;
reg [2:0] s_cnt;
reg       s_flag;
reg       s_flag_dly1;
reg       s_flag_dly2;

always @(posedge lvds_clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    shift_reg <= 8'h00;
  else
    shift_reg <= {shift_reg[6:0],lvds_d};
end

always @(posedge lvds_clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    s_cnt <= 3'b000;
  else
    s_cnt <= s_cnt + 3'b001;
end

always @(*)
begin
  if(rst_n == 1'b0)
    s_flag = 1'b0;
  else if(s_cnt == 3'b111)
    s_flag = 1'b1;
  else
    s_flag = 1'b0;
end

always @(posedge lvds_clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    begin
    s_flag_dly1 <= 1'b0;
	s_flag_dly2 <= 1'b0;
	end
  else
    begin
    s_flag_dly1 <= s_flag;
	s_flag_dly2 <= s_flag_dly1;
	end
end

always @(posedge lvds_clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    o_lvds_d <= 8'h00;
  else if(s_flag_dly1 == 1'b1)
    o_lvds_d <= shift_reg;
end

endmodule