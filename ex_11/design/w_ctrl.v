module w_ctrl(
       input wire w_clk, //Write Clock
       input wire rst_n,
       input wire w_en,
       
       input wire [8:0]r_gaddr,
     
       output reg   w_full,
       output wire [7:0]w_addr,
       output reg  [8:0]w_gaddr
);

reg [8:0]r_gaddr_1d;
reg [8:0]r_gaddr_2d;

reg [8:0]w_addr_bin_wire;
reg [8:0]w_addr_bin;

wire [8:0]w_gaddr_wire;



always @(w_en or w_full or w_addr_bin)
begin
 if((w_en==1'b1)&&(w_full==1'b0))
   w_addr_bin_wire=w_addr_bin+9'd1;
 else
   w_addr_bin_wire=w_addr_bin;
end

always @(posedge w_clk or negedge rst_n)
begin
	if(rst_n==1'b0)
	  	w_addr_bin<=9'd0;
	else 
      w_addr_bin<=w_addr_bin_wire;
end

assign w_addr = w_addr_bin[7:0];

assign w_gaddr_wire = {1'b0,w_addr_bin_wire[8:1]}^w_addr_bin_wire;
always @(posedge w_clk or negedge rst_n)
begin
	if(rst_n==1'b0)
	  	w_gaddr<=9'd0;
	else
      w_gaddr<=w_gaddr_wire;
end

always @(posedge w_clk or negedge rst_n)
begin
	if(rst_n==1'b0)
	  begin
	  	r_gaddr_1d<=9'd0;
	    r_gaddr_2d<=9'd0;
	  end
	else
	  begin
	    r_gaddr_1d<=r_gaddr;
	    r_gaddr_2d<=r_gaddr_1d;
	  end
end

always @(posedge w_clk or negedge rst_n)
begin
	if(rst_n==1'b0)
	  w_full<=1'b0;
	else
	  w_full<= ( (w_gaddr_wire[8]!=r_gaddr_2d[8])&&(w_gaddr_wire[7]!=r_gaddr_2d[7])&&(w_gaddr_wire[6:0]==r_gaddr_2d[6:0]) );
end

endmodule