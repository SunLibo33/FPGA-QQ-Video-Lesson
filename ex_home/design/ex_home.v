module ex_home(
       input wire clk,
	   input wire rst_n,
	   input wire cin,
	   output reg cout
);

reg[6:0] state;
reg[6:0] next_state;

parameter idle = 7'b0000001;
parameter s1   = 7'b0000010;
parameter s2   = 7'b0000100;
parameter s3   = 7'b0001000;
parameter s4   = 7'b0010000;
parameter s5   = 7'b0100000;
parameter s6   = 7'b1000000;

always @(posedge clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    state <= idle;
  else
    state <= next_state;
end

always @(*)
begin
  if(rst_n == 1'b0)
    next_state = idle;
  else 
  case(state)
    idle: 
		     next_state = s1;
    s1: 
	       if(cin==1'b1) 
		     next_state = s2;
		   else
		     next_state = idle;
    s2: 
	       if(cin==1'b0) 
		     next_state = s3;
		   else
		     next_state = idle;	
    s3: 
	       if(cin==1'b0) 
		     next_state = s4;
		   else
		     next_state = idle;	
    s4: 
	       if(cin==1'b1) 
		     next_state = s5;
		   else
		     next_state = idle;
    s5: 
	       if(cin==1'b0) 
		     next_state = s6;
		   else
		     next_state = idle;
    s6: 
		     next_state = idle;			 
    default:next_state = idle;		 
  endcase
   
end

always @(posedge clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
    cout <= 1'b0;
  else if(state==s6)
	cout <= 1'b1; 
  else	
    cout <= 1'b0;	  
end

endmodule
