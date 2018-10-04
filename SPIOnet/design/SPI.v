`timescale 1ns/10ps;
module SPI(
       input wire        clk,
	   input wire        rst_n,
	   input wire        spi_reset,
	   input wire        mosi,
	   input wire        cs_n,
	   input wire        sclk,
	   input wire [31:0] rd_data,
	   output            miso,
	   output reg        wr_en,    //
	   output reg        rd_en,
	   output reg [8:0]  wr_addr,  //
	   output reg [8:0]  rd_addr,
	   output     [14:0] addr,     //
	   output reg [31:0] wr_data   //
);

parameter IDLE  = 5'b00001;
parameter INIT  = 5'b00010;
parameter CHECK = 5'b00100;
parameter READ  = 5'b01000;
parameter WRITE = 5'b10000;

reg [4:0] Current_State;
reg [4:0] Next_State;

reg       spi_reset_reg0;
reg       spi_reset_reg1;
reg       StartCom;
reg       StopCom;

reg       cs_n_reg0;
reg       cs_n_reg1;
reg       CS_Rise;
reg       CS_Fall;

reg       sclk_reg0;
reg       sclk_reg1;
reg       sclk_Rise;
reg       sclk_Fall;

reg       [31:0]RX_Data_Buf;
reg       [31:0]TX_Data_Buf;
reg       [31:0]Header_Buf;

reg       [15:0]sclk_Rise_Cnt;

reg       wr_en_pre;

wire       WR_OPCODE;

assign WR_OPCODE = Header_Buf[31];
assign addr      = Header_Buf[30:16];

always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
	TX_Data_Buf <= 32'h0000_0000;  
  else if( (Current_State==IDLE)||(Current_State==INIT)||(Current_State==WRITE) )
    TX_Data_Buf <= 32'h0000_0000; 
  else if( (Current_State==CHECK)&&(CS_Fall==1'b1) )
    TX_Data_Buf <= Header_Buf;
  else if( (Current_State==READ)&& ( (CS_Fall==1'b1)||( (sclk_Fall==1'b1)&&(sclk_Rise_Cnt[4:0]==5'd0)  ) ) 	)
    TX_Data_Buf <= rd_data;
  else if(sclk_Fall==1'b1)	
    TX_Data_Buf <= {TX_Data_Buf[30:0],1'b0};
end

assign miso = TX_Data_Buf[31];



always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
	rd_addr <= 9'd0; 	
  else if(Current_State!=READ)
	rd_addr <= 9'd0; 
  else if( (sclk_Fall==1'b1)&&(sclk_Rise_Cnt[4:0]==5'd16) )
    rd_addr <= rd_addr + 9'd1;
end

 
always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
	rd_en <= 1'b0; 	
  else if( (Current_State==CHECK)&&(CS_Rise==1'b1)&&(WR_OPCODE==1'b0) )
	rd_en <= 1'b1; 
  else if( (Current_State==READ)&&(sclk_Fall==1'b1)&&(sclk_Rise_Cnt[4:0]==5'd16) )
    rd_en <= 1'b1; 
  else	
    rd_en <= 1'b0; 
end

always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
    begin
	  Header_Buf <= 32'h0000_0000;  
    end
  else
    begin
	  if( (CS_Rise==1'b1)&&(Current_State==INIT) )
        Header_Buf <= RX_Data_Buf;  
    end
end

always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
    begin 
	  wr_en_pre   <= 1'b0;
    end
  else
    begin
	  if( (sclk_Rise_Cnt[4:0]==5'b11111)&&(Current_State==WRITE)&&(sclk_Rise==1'b1) )
        wr_en_pre   <= 1'b1;
	  else	
	    wr_en_pre   <= 1'b0;
    end
end

always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
    begin 
	  wr_en   <= 1'b0;
    end
  else
    begin
      wr_en   <= wr_en_pre;
    end
end

always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
    begin 
	  wr_addr   <= 9'd0;
    end
  else
    begin
      if(Current_State!=WRITE)
	    wr_addr   <= 9'd0;
	  else if(wr_en==1'b1)
	    wr_addr   <= wr_addr + 9'd1;
    end
end

always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
    begin 
	  wr_data   <= 32'h0000_0000;
    end
  else
    begin
      if(wr_en_pre==1'b1)
	    wr_data <=  RX_Data_Buf; 
    end
end


always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
    begin
	  RX_Data_Buf   <= 32'h0000_0000;  
	  sclk_Rise_Cnt <= 16'h0000;
    end
  else
    begin
	  if(CS_Fall==1'b1)
	    begin
	      RX_Data_Buf   <= 32'h0000_0000;
		  sclk_Rise_Cnt <= 16'h0000;
		end
	  else if(sclk_Rise==1'b1)	
	    begin
	      RX_Data_Buf <= {RX_Data_Buf[30:0],mosi}; 
		  sclk_Rise_Cnt <= sclk_Rise_Cnt + 16'h0001;
		end
    end
end



always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
    begin
	  sclk_reg0 <= 1'b0;
      sclk_reg1 <= 1'b0;
      sclk_Rise <= 1'b0;
      sclk_Fall <= 1'b0;
    end
  else
  begin
    sclk_reg0 <= sclk;
    sclk_reg1 <= sclk_reg0;
    sclk_Rise <= (sclk_reg0==1'b1)&&(sclk_reg1==1'b0);
    sclk_Fall <= (sclk_reg0==1'b0)&&(sclk_reg1==1'b1);
  end
end



always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
    begin
	  spi_reset_reg0 <= 1'b0;
      spi_reset_reg1 <= 1'b0;
      StartCom       <= 1'b0;
      StopCom        <= 1'b0;
    end
  else
  begin
    spi_reset_reg0 <= spi_reset;
    spi_reset_reg1 <= spi_reset_reg0;
    StartCom       <= (spi_reset_reg0==1'b0)&&(spi_reset_reg1==1'b1);
    StopCom        <= (spi_reset_reg0==1'b1)&&(spi_reset_reg1==1'b0);
  end
end


always @(posedge clk or negedge rst_n)
begin
  if(rst_n==1'b0)
    begin
	  cs_n_reg0 <= 1'b0;
      cs_n_reg1 <= 1'b0;
      CS_Rise   <= 1'b0;
      CS_Fall   <= 1'b0;
    end
  else
    begin
	  cs_n_reg0 <= cs_n;
	  cs_n_reg1 <= cs_n_reg0;
	  CS_Rise   <= (cs_n_reg0==1'b1)&&(cs_n_reg1==1'b0);
	  CS_Fall   <= (cs_n_reg0==1'b0)&&(cs_n_reg1==1'b1);
    end
end


always @(posedge clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    Current_State <= IDLE;
  else
    Current_State <= Next_State;
end

always @(*)
begin
  if(rst_n == 1'b0)
    Next_State = IDLE;
  else 
  case(Current_State)
    IDLE: 
	  if(StartCom==1'b1) 
	    Next_State = INIT;
	  else
		Next_State = IDLE;   
    INIT:	
	  if(CS_Rise==1'b1) 
	    Next_State = CHECK;
	  else
		Next_State = INIT;
    CHECK:	
	  if(CS_Rise==1'b1) 
	    Next_State = WR_OPCODE ? WRITE : READ;
	  else
		Next_State = CHECK;	
    WRITE:	
	  if(CS_Rise==1'b1) 
	    Next_State = IDLE;
	  else
		Next_State = WRITE;	
    READ:	
	  if(CS_Rise==1'b1) 
	    Next_State = IDLE;
	  else
		Next_State = READ;		
    default:Next_State = IDLE;		 
  endcase		 	 
end

endmodule