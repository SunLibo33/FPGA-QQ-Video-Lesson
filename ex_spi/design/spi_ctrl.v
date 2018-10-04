module spi_ctrl(
       input wire sclk, //system clock 50Mhz
	   input wire rst_n,
	   input wire work_en,
	   output wire spi_clk,
	   output wire spi_sdi,
	   output wire spi_csn,
	   input wire  spi_sdo,
	   output reg  conf_end

);

parameter IDLE = 5'b00001;
parameter WAIT = 5'b00010;
parameter READ_MEM = 5'b00100;
parameter WRITE_REG = 5'b01000;
parameter STOP = 5'b10000;

parameter H_DIV_CYC=5'd24;

reg [4:0] cur_state;
reg [4:0] next_state;
reg [4:0] div_cnt;
reg [3:0] wait_cnt;
reg [3:0] shift_cnt;
reg [4:0] r_addr;
wire [15:0] r_data;
reg  [15:0] shift_buf;

reg clk_p=1'b0;
wire clk_n;
wire wren;
reg pose_flag;
reg data_end;

reg sdi;
reg csn;
reg tck;

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    conf_end<=1'b0;
  else if(cur_state==STOP)
	conf_end<=1'b1;
  else
    conf_end<=1'b0;
end

assign spi_clk = tck;
assign spi_csn = csn;
assign spi_sdi = sdi;

assign wren  = 1'b0;
assign clk_n = ~clk_p;

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    div_cnt<=5'b00000;
  else if(div_cnt==H_DIV_CYC)
    div_cnt<=5'b00000;
  else
    div_cnt<=div_cnt+5'b0001; 
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    clk_p<=1'b0;
  else if(div_cnt==H_DIV_CYC)
    clk_p<=~clk_p;
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    pose_flag<=1'b0;
  else if ( (div_cnt==H_DIV_CYC)&&(clk_p==1'b0) )
    pose_flag<=1'b1;
  else
    pose_flag<=1'b0;
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    wait_cnt<=4'b0000;
  else if((cur_state==WAIT)&&(pose_flag==1'b1))
    wait_cnt<=wait_cnt+4'b0001;
  else if(cur_state!=WAIT)
    wait_cnt<=4'b0000;
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    cur_state<=IDLE;
  else
    cur_state<=next_state; 
end

always @(*)
begin
  if(rst_n==1'b0)
    next_state=IDLE;
  else
    case(cur_state)
    IDLE: 
	     if(work_en==1'b1) 
		   next_state = WAIT;
		 else
		   next_state = IDLE;
    WAIT:
	     if(wait_cnt[3]==1'b1)
		   next_state = READ_MEM;
		 else
		   next_state = WAIT;
    READ_MEM:
	       next_state = WRITE_REG;
	WRITE_REG:	
	     if((pose_flag==1'b1)&&(shift_cnt==4'b1111)&&(data_end!=1'b1))
            next_state = WAIT;
	     else if((pose_flag==1'b1)&&(shift_cnt==4'b1111)&&(data_end==1'b1))
            next_state = STOP;			
		 else
		    next_state = WRITE_REG;
	STOP:
	     next_state=STOP;
 
    default:next_state = IDLE;		 
  endcase
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    shift_cnt<=4'b0000;
  else if((pose_flag==1'b1)&&(cur_state==WRITE_REG))
    shift_cnt<=shift_cnt+4'b0001; 
  else if(cur_state!=WRITE_REG)
    shift_cnt<=4'b0000;
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    r_addr<=5'b00000;
  else if(cur_state==READ_MEM)
    r_addr<=r_addr+5'b00001; 
 
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    data_end<=1'b0;
  else if((cur_state==READ_MEM)&&((&r_addr)==1'b1))
	data_end<=1'b1;    
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    shift_buf<=16'h0000;
  else if(cur_state==READ_MEM)
    shift_buf<=r_data; 
  else if((pose_flag==1'b1)&&(cur_state==WRITE_REG))
    shift_buf<={shift_buf[14:0],1'b1};
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    sdi<=1'b0;
  else if(cur_state==WRITE_REG)//&&(pose_flag==1'b1)
	sdi<=shift_buf[15]; 
  else
    sdi<=1'b0;
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    csn<=1'b1;
  else if(cur_state==WRITE_REG)//&&(pose_flag==1'b1)
	csn<=1'b0;
  else
    csn<=1'b1;
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    tck<=1'b0;
  else if(cur_state==WRITE_REG)
	tck<=clk_n;
  else
    tck<=1'b0;
end

ram_16x32_sr	ram_16x32_sr_inst (
	.address ( r_addr ), //读地址
	.clock ( sclk ),
	.data ( 16'd0 ),  //写数据
	.wren ( wren ), //写使能高有效，读使能低有效
	.q ( r_data )//读数据
	);

endmodule 