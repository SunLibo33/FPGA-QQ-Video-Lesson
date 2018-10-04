`timescale 1ns/100ps
module tb_mealy();
reg      tb_clk;
reg      tb_rst_n;
reg      tb_A;
wire     tb_k;

initial begin
        tb_clk<=1'b0;
		tb_rst_n<=1'b0;
		#100;
		tb_rst_n<=1'b1;

end


initial begin
        tb_A<=1'b0;
		#200;
		rand_bit();
end

always #10 tb_clk=~tb_clk;

mealy tb_mealy_instance(
.clk(tb_clk),
.rst_n(tb_rst_n),
.A(tb_A),
.k(tb_k)
);

task rand_bit();
     integer i;
	 begin
	   for(i=0;i<256;i=i+1)
	     begin
		   @(posedge tb_clk);
		     //tb_A<=$random%10; //Generate data from -10 to +9;
			 //tb_A<={$random}%10; //Generate data from 0 to +9;
			 tb_A<={$random}%2; //Generate data from 0 to +1;
		 end
	 end
endtask	 

endmodule
