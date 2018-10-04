`timescale 1ns/10ps;

module TB_SPI();

reg TB_clk;
reg TB_rst_n;
reg TB_spi_reset;
reg TB_mosi;
reg TB_cs_n;
reg TB_sclk;
reg [31:0] TB_rd_data;

wire TB_miso;
wire TB_wr_en;
wire TB_rd_en;
wire [8:0] TB_wr_addr;
wire [8:0] TB_rd_addr;
wire [14:0] TB_addr;
wire [31:0] TB_wr_data;


SPI SPI_Instance(
       .clk(TB_clk),
	   .rst_n(TB_rst_n),
	   .spi_reset(TB_spi_reset),
	   .mosi(TB_mosi),
	   .cs_n(TB_cs_n),
	   .sclk(TB_sclk),
	   .rd_data(TB_rd_data),
	   .miso(TB_miso),
	   .wr_en(TB_wr_en),
	   .rd_en(TB_rd_en),
	   .wr_addr(TB_wr_addr),
	   .rd_addr(TB_rd_addr),
	   .addr(TB_addr),
	   .wr_data(TB_wr_data)
);

initial 
begin
  TB_clk <= 1'b0;
  TB_rst_n <= 1'b0;
  TB_rd_data <= 32'hAAAA_AAAA;
  #100;
  TB_rst_n <= 1'b1;
  #6330;
  TB_rd_data <= 32'hAAAA_0787;
end

always #2.5  TB_clk<=~TB_clk;

initial 
begin
  TB_spi_reset <= 1'b0;
  #200;
  TB_spi_reset <= 1'b1;
  #100;
  TB_spi_reset <= 1'b0;
end


task SPI_Hardware();
     integer i;
	 begin
	   for(i=0;i<32;i=i+1)
	     begin
         //TB_cs_n;
         TB_sclk=1'b0;
		 if(i==0)
		   TB_mosi=1'b0;
		 else
		   TB_mosi={$random}%2;
		 #20; 
		 TB_sclk=1'b1;
		 #20; 
		 end
	 end
endtask	

initial 
begin
  TB_cs_n=1'b1;
  TB_sclk=1'b0;
  TB_mosi=1'b0;
  #400;
  
  TB_cs_n=1'b0;
  #100;
  SPI_Hardware();
  TB_sclk=1'b0;
  #100;
  TB_cs_n=1'b1;
  #100;
  //
  
  TB_cs_n=1'b0;
  #100;
  SPI_Hardware();
  TB_sclk=1'b0;
  #100;
  TB_cs_n=1'b1;
  #100;
  //
  
  TB_cs_n=1'b0;
  #100;
  SPI_Hardware();
  TB_sclk=1'b0;
  #100;
  //
  #100;
  SPI_Hardware();
  TB_sclk=1'b0;
  #100;
  //
  #100;
  SPI_Hardware();
  TB_sclk=1'b0;
  #100;
  TB_cs_n=1'b1;
  #100;
  
end
 
 

endmodule
 
 