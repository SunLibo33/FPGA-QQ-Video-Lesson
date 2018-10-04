`timescale 1ns/100ps

module tb_ex_ise_fifo(); 

reg  tb_sclk;
reg  tb_rst_n;
reg  [7:0]tb_data_in;
reg  tb_data_v;
reg  tb_r_flag;
wire [7:0]tb_dout;

wire tb_prog_full;
wire tb_prog_empty;

ex_ise_fifo ex_ise_fifo_instance(
     .sclk   (tb_sclk   ),
     .rst_n  (tb_rst_n  ),
     .data_in(tb_data_in),
     .data_v (tb_data_v ),
     .r_flag (tb_r_flag ),
     .dout   (tb_dout   ),
     .prog_full(tb_prog_full),
     .prog_empty(tb_prog_empty)
    );
    
initial
begin
	tb_sclk =1'b0;
	tb_rst_n=1'b0;
	#100;
	tb_rst_n=1'b1;
end    

always #10 tb_sclk=~tb_sclk;

initial
begin
  tb_data_in=8'h00;
  tb_data_v=1'b0;
  tb_r_flag=1'b0;
  #200;
  send_data();
  #60;
  read_data();
end    

task send_data();
     integer i;
     begin
     	 for(i=0;i<259;i=i+1)
     	 begin
     	 	 @(posedge tb_sclk);
     	 	   tb_data_in=i[7:0];
     	 	   tb_data_v=1'b1;
       end
       @(posedge tb_sclk);
       tb_data_v=1'b0;
       tb_data_in=8'h00;
     end
endtask

task read_data();
     integer i;
     begin
     	 for(i=0;i<259;i=i+1)
     	 begin
     	 	 @(posedge tb_sclk);
     	 	   tb_r_flag=1'b1;
       end
       @(posedge tb_sclk);
       tb_r_flag=1'b0;
     end
endtask

endmodule