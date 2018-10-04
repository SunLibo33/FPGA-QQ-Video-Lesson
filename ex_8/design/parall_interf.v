`timescale 1ns/100ps
module parall_interf(
       input wire sclk,
       input wire rst_n,
       input wire cs_n,
       input wire rd_n,
       input wire wr_n,
       inout tri  [15:0]data,
       input wire [7:0] addr    
);

//parameter =;

reg [15:0] data_0;
reg [15:0] data_1;
reg [15:0] data_2;
reg [15:0] data_3;
reg [15:0] data_4,
           data_5,
           data_6,
           data_7;

reg [2:0] cs_n_r,rd_n_r,wr_n_r;

reg [47:0] data_r;
reg [23:0] addr_r;
reg [15:0] rdata;



always @(posedge sclk or negedge rst_n)
begin
	if(rst_n==1'b0)
	  begin
	  	cs_n_r<=3'b111;
	  	rd_n_r<=3'b111;
	  	wr_n_r<=3'b111;
	  end
	else
	  begin
	    cs_n_r<={cs_n_r[1:0],cs_n};	
	    rd_n_r<={rd_n_r[1:0],rd_n};	
	    wr_n_r<={wr_n_r[1:0],wr_n};	
	  end
end

/*
always @(posedge sclk or negedge rst_n)
begin
	if(rst_n==1'b0)
	  begin
	  	{cs_n_r,rd_n_r,wr_n_r}<=9'b111_111_111;
	  end
	else
	  begin
	  	{cs_n_r,rd_n_r,wr_n_r}<={{cs_n_r[1:0],cs_n},{rd_n_r[1:0],rd_n},{wr_n_r[1:0],wr_n}};
	  end
end
*/ 


always @(posedge sclk or negedge rst_n)
begin
	if(rst_n==1'b0)
	  begin
	  	data_r<=48'd0;
	  	addr_r<=24'd0;
	  end
	else
	  begin
      data_r<={data_r[31:0],data};
      addr_r<={addr_r[15:0],addr};
	  end
end
 
always @(posedge sclk or negedge rst_n)
begin
	if(rst_n==1'b0)
	  begin
	  	data_0<=16'h0000;
	  	data_1<=16'h0000;
	  	data_2<=16'h0000;
	  	data_3<=16'h0000;
	  	data_4<=16'h0000;
	  	data_5<=16'h0000;
	  	data_6<=16'h0000;
	  	data_7<=16'h0000;
	  end
	else if( (cs_n_r[2]==1'b0)&&(wr_n_r[2]==1'b0)&&(rd_n_r[2]==1'b1) )
	  begin
	  	case(addr_r[23:16])
	  		8'd0: data_0 <= data_r[47:32];
	  		8'd1: data_1 <= data_r[47:32];
	  		8'd2: data_2 <= data_r[47:32];
	  		8'd3: data_3 <= data_r[47:32];
	  		8'd4: data_4 <= data_r[47:32];
	  		8'd5: data_5 <= data_r[47:32];
	  		8'd6: data_6 <= data_r[47:32];
	  		8'd7: data_7 <= data_r[47:32]; 	
	  	  default:	
	  	    begin
	  	    	data_0<=data_0;
	  	    	data_1<=data_1;
	  	    	data_2<=data_2;
	  	    	data_3<=data_3;
	  	    	data_4<=data_4;
	  	    	data_5<=data_5;
	  	    	data_6<=data_6;
	  	    	data_7<=data_7;	
	  	    end  		
	  	endcase
	  end
	  
end

always @(posedge sclk or negedge rst_n)
begin
	if(rst_n==1'b0)
	  begin
	  	rdata<=16'h0000;
	  end
	else if( (cs_n_r[2]==1'b0)&&(wr_n_r[2]==1'b1) )
	  begin
     case(addr_r[23:16])
	  		8'd0: rdata <= data_0;
	  		8'd1: rdata <= data_1;
	  		8'd2: rdata <= data_2;
	  		8'd3: rdata <= data_3;
	  		8'd4: rdata <= data_4;
	  		8'd5: rdata <= data_5;
	  		8'd6: rdata <= data_6;
	  		8'd7: rdata <= data_7;	
	  	  default:	rdata <= 	16'h0000;
	  	endcase
	  end
end

assign data = ( (cs_n_r[2]==1'b0)&&(rd_n_r[2]==1'b0) ) ? rdata : 16'hzzzz;


endmodule