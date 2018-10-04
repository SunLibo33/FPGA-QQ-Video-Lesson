module ex_fsm(
       input wire  sclk,
	   input wire  rst_n,
	   input wire  A,
	   output reg  k1,
	   output reg  k2
);

parameter IDLE  = 4'b0001;
parameter START = 4'b0010;
parameter STOP  = 4'b0100;
parameter CLEAR = 4'b1000;

reg [3:0] state;
//reg [3:0] next_state;

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    state <= IDLE;
  else
    case(state)
	  IDLE:if(A==1'b1)
	         state <= START;
	  START:if(A==1'b0)
	         state <= STOP;	
	  STOP:if(A==1'b1)
	         state <= CLEAR;
	  CLEAR:if(A==1'b0)
	         state <= IDLE;	
      default:state <= IDLE;	 
	endcase
end


always @(posedge sclk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    k1 <= 1'b0;
  else if(state==IDLE && A==1'b1)
    k1 <= 1'b0;
  else if(state==CLEAR && A==1'b0)
    k1 <= 1'b1;	
  //end	
end

always @(posedge sclk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    k2 <= 1'b0;
  else if(state==STOP && A==1'b1)
    k2 <= 1'b1;
  else if(state==CLEAR && A==1'b0)
    k2 <= 1'b0;	
  //end	
end

endmodule