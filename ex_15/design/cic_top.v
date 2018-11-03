module cic_top(
       input wire sclk,
       input wire rst_n
);

wire signed [7:0] data_con;
wire              data_v;
wire signed [22:0] data_out;

gen_sin gen_sin_instance(
       .sclk    (sclk  )  ,
       .rst_n   (rst_n )  ,
       .data_o  (data_con)  ,
       .data_v  (data_v)
);


cic_interpolate cic_interpolate_instance (
			 .sclk      (sclk    ) ,     //50MHz
			 .rst_n     (rst_n   ) ,
			 .data_in   (data_con ) , //50/64 MSPS -->50/4 MSPS , Sin waveform
			 .data_v    (data_v  ) ,
			 .data_out  (data_out)

);

/*
module cic_interpolate(
			 input wire               sclk,    //50MHz
			 input wire               rst_n,
			 input wire signed[7:0]   data_in, //50/64 MSPS -->50/4 MSPS , Sin waveform
			 input wire               data_v,
			 output wire signed[22:0] data_out

);
module gen_sin(
       input wire        sclk,
       input wire        rst_n,
       output wire [7:0] data_o,
       output wire       data_v
);
*/

endmodule