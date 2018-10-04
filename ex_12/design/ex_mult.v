module ex_mult(
       input wire sclk,
	   input wire rst_n,
	   input wire [15:0]in_a,
	   input wire [15:0]in_b,
	   output wire [31:0] out_rslt,
	   output wire [7:0]remain_sig
);

 
divier_16d8_l3	divier_16d8_l3_inst (
	.clock ( sclk ),
	.denom ( in_b[7:0] ),
	.numer ( in_a ),
	.quotient ( out_rslt[15:0] ),
	.remain ( remain_sig )
	);

/* mult_16x16_l1	mult_16x16_l1_inst (
	.clock ( sclk ),
	.dataa ( in_a ),
	.datab ( in_b ),
	.result ( out_rslt )
	); */

endmodule