`timescale 1ns/100ps
module tb_parall_interf();

parameter setup_time = 2;
parameter hold_time  = 2;
parameter data_time  = 4;
parameter read_wait  = 5;
parameter read_time  = 2;

reg tb_sclk;
reg tb_rst_n;
reg tb_cs_n;
reg tb_rd_n;
reg tb_wr_n;

reg [7:0]  tb_addr;
reg [15:0] wr_data;
wire [15:0] tb_data;

assign tb_data = (tb_wr_n==1'b0)?wr_data:16'hzzzz;

initial begin
	tb_sclk=1'b0;
	tb_rst_n=1'b0;
	#200;
	tb_rst_n=1'b1;
end

always #10 tb_sclk=~tb_sclk;

parall_interf parall_interf_instance(
      .sclk  (tb_sclk ),
      .rst_n (tb_rst_n),
      .cs_n  (tb_cs_n ),
      .rd_n  (tb_rd_n ),
      .wr_n  (tb_wr_n ),
      .data  (tb_data ),
      .addr  (tb_addr ) 
);

initial 
begin
  tb_cs_n=1'b1;
  tb_rd_n=1'b1;
  tb_wr_n=1'b1;

  tb_addr=8'h00;
  wr_data=16'h0000;
 
	//@(posedge tb_rst_n);
	#300;
	
	write_data(8);
	#100;
	
	read_data(8);
end

//reg [7:0]  tb_addr;
//reg [15:0] tb_data;
task write_data(len);
     integer i,len;
     begin
     	for(i=0;i<len;i=i+1)
     	  begin
     	    tb_cs_n=1'b0;
          tb_rd_n=1'b1;
          tb_wr_n=1'b1;
          tb_addr=i[7:0];
          wr_data=i[15:0];
          setup_dly();
          tb_wr_n=1'b0;	
          data_dly();
          tb_wr_n=1'b1;
          hold_dly();
          //tb_cs_n=1'b1;   
     	  end
     	  tb_cs_n=1'b1;
     end 
endtask

task read_data(len);
     integer i,len;
     begin
     	for(i=0;i<len;i=i+1)
     	  begin
     	    tb_cs_n=1'b0;
          tb_rd_n=1'b1;
          tb_wr_n=1'b1;
          tb_addr=i[7:0];
          read_dly();
          tb_rd_n=1'b0;	
          data_dly();
          $display("read data addr is %d = %d",i,tb_data);
          tb_rd_n=1'b1;
          //tb_cs_n=1'b1;   
     	  end
     	  tb_cs_n=1'b1;
     end 
endtask

task setup_dly();
     integer i;
     begin 
     	 for(i=0;i<setup_time;i=i+1)
     	 @(posedge tb_sclk);
     end 
endtask

task hold_dly();
     integer i;
     begin 
     	 for(i=0;i<hold_time;i=i+1)
     	 @(posedge tb_sclk);
     end 
endtask

task data_dly();
     integer i;
     begin 
     	 for(i=0;i<data_time;i=i+1)
     	 @(posedge tb_sclk);
     end 
endtask

task wait_dly();
     integer i;
     begin 
     	 for(i=0;i<read_wait;i=i+1)
     	 @(posedge tb_sclk);
     end 
endtask

task read_dly();
     integer i;
     begin 
     	 for(i=0;i<read_time;i=i+1)
     	 @(posedge tb_sclk);
     end 
endtask


endmodule