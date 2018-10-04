module ex_case( 
       input wire        rst_n,
       input wire        sclk,
	   output reg        o_dv,
	   output reg  [7:0] o_data,
	   
	   input wire  [9:0] i_data,
	   input wire  [7:0] i_addr
);

reg [2:0] cnt_7;
always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    cnt_7 <= 3'b000;
  else
    cnt_7 <= cnt_7 + 3'b001;
end


always @(posedge sclk or negedge rst_n)
begin
  if(rst_n==1'b0)
    begin
      o_data <= 8'h00;
	  o_dv   <= 1'b0;
	end
  else
     begin  
	     case(cnt_7)
		     3'b000:
                begin
				  o_data <= 8'd7;
				  o_dv   <= 1'b1;
                end		
		     3'b001:
                begin
				  o_data <= 8'd0;
				  o_dv   <= 1'b0;
                end		
		     3'b010:
                begin
				  o_data <= 8'd5;
				  o_dv   <= 1'b1;
                end		
            default:
                begin
				  o_data <= 8'd0;
				  o_dv   <= 1'b0;				
                end				

		 endcase
	 
     end	 

end

/*
always @(*)
//always @(rst_n or cnt_7)
begin
  if(rst_n==1'b0)
    begin
      o_data = 8'h00;
	  o_dv   = 1'b0;
	end
  else
     begin  
	     case(cnt_7)
		     3'b000:
                begin
				  o_data = 8'd7;
				  o_dv   = 1'b1;
                end		
		     3'b001:
                begin
				  o_data = 8'd0;
				  o_dv   = 1'b0;
                end		
		     3'b010:
                begin
				  o_data = 8'd5;
				  o_dv   = 1'b1;
                end		
             default:
                begin
				  o_data = 8'd0;
				  o_dv   = 1'b0;				
                end		 		
		 endcase
     end	 
end
*/

endmodule