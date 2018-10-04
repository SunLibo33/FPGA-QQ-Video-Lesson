`timescale 1ns/100ps

module tb_ex_case;

reg tb_sclk,tb_rst_n;

reg  [9:0] tb_i_data;
reg  [7:0] tb_i_addr;

wire tb_o_dv;
wire  [7:0] tb_o_data;


initial begin
   tb_sclk = 1'b0;
   tb_rst_n= 1'b0;
   #200
   tb_rst_n= 1'b1;   
end

initial begin
     tb_i_addr <= 0;
     tb_i_data <= 0;	
#200
send_data(256);  
end

always #10 tb_sclk <= ~tb_sclk;


ex_case ex_case_inst( 
       .rst_n(tb_rst_n),
       .sclk(tb_sclk),
	   .o_dv(tb_o_dv),
	   .o_data(tb_o_data),
	   .i_data(tb_i_data),
	   .i_addr(tb_i_addr)
);

task send_data(len);
     integer len,i; //变量声明区，32位的整形数
	 begin
	    for(i=0;i<len;i=i+1)
		begin
		  @(posedge tb_sclk);

		  case(i)
            0:begin
			      tb_i_addr <= i[7:0];
		          tb_i_data <= 10'h0ff;
              end		
            1:begin
			      tb_i_addr <= i[7:0];
		          tb_i_data <= 10'h055;
              end	
            2:begin
			      tb_i_addr <= i[7:0];
		          tb_i_data <= 10'h000;
		      end
              default:begin
			      tb_i_addr <= i[7:0];
		          tb_i_data <= 10'h0ff;				  
              end				  
		  endcase
		end	
     tb_i_addr <= 0;
     tb_i_data <= 0;		
	 end
endtask


endmodule 