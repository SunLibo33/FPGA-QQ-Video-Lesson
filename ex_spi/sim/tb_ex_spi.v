`timescale 1ns/100ps

module tb_ex_spi();

reg tb_sclk;
reg tb_rst_n;
reg tb_work_en;

reg tb_spi_sdo;

wire tb_spi_clk;
wire tb_spi_sdi;
wire tb_spi_csn;
wire tb_conf_end;

reg [15:0] send_mem [31:0];
reg [15:0] shift_buf;

initial 
begin
  tb_sclk<=1'b0;
  tb_rst_n<=1'b0;
  #100;
  tb_rst_n<=1'b1; 
end
 
always #10 tb_sclk <=~tb_sclk;

initial 
begin
  tb_work_en<=1'b0;
  #150;
  tb_work_en<=1'b1; 
end

spi_ctrl   spi_ctrl_instance
(
       .sclk(tb_sclk),  
	   .rst_n(tb_rst_n),
	   .work_en(tb_work_en),
	   .spi_clk(tb_spi_clk),
	   .spi_sdi(tb_spi_sdi),
	   .spi_csn(tb_spi_csn),
	   .spi_sdo(tb_spi_sdo),
	   .conf_end(tb_conf_end)

);

initial 
begin
  $readmemb("data.mif",send_mem);
end


initial 
begin
  rec_spi();
end


task rec_spi();
     integer i,j;
	 begin
	   for(i=0;i<32;i=i+1)
	   begin
	     for(j=0;j<16;j=j+1)
		    begin
	         @(posedge tb_spi_clk);
			   shift_buf={shift_buf[14:0],tb_spi_sdi};		   
	           
     
                if((shift_buf==send_mem[i])&&(j==15))
		          $display("Right word index was %d, rec_d=%d, send_d=%d",i,shift_buf,send_mem[i]);
	            else  if(j==15)
		          $display("Error word index was %d, rec_d=%d, send_d=%d",i,shift_buf,send_mem[i]);
				  
		    end
	   end

	 end

endtask

endmodule 