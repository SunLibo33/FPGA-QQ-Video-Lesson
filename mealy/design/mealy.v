//11101
module mealy(
       input wire clk,
	   input wire rst_n,
	   input wire A,
	   output reg k
);

parameter S1=6'b00_0001;
parameter S2=6'b00_0010;
parameter S3=6'b00_0100;
parameter S4=6'b00_1000;
parameter S5=6'b01_0000;
parameter S6=6'b10_0000;

reg [5:0] Current_State;
reg [5:0] Next_State;

always @(posedge clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    Current_State <= S1;
  else
    Current_State <= Next_State;
end

always @(*)
begin
  if(rst_n == 1'b0)
    Next_State = S1;
  else 
  case(Current_State)
    S1: 
	       if(A==1'b1) 
		     Next_State = S2;
		   else
		     Next_State = S1;
    S2: 
	       if(A==1'b1) 
		     Next_State = S3;
		   else
		     Next_State = S1;
    S3: 
	       if(A==1'b1) 
		     Next_State = S4;
		   else
		     Next_State = S1;	
	S4: 
	       if(A==1'b1) 
		     Next_State = S4;
		   else
		     Next_State = S5;	
	S5: 
	       if(A==1'b1) 
		     Next_State = S6;
		   else
		     Next_State = S1;	
	S6: 
	       if(A==1'b1) 
		     Next_State = S3;
		   else
		     Next_State = S1;
   		 
    default:Next_State = S1;		 
  endcase
end

always @(posedge clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    k <= 1'b0;
  else if( (Current_State == S5)&&(A==1'b1) )
    k <= 1'b1;
  else
    k <= 1'b0;
end

endmodule