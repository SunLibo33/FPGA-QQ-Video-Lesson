module top_fir_lpf(
       input wire sclk,
	   input wire rst_n,
	   output wire [20:0] lpf_wave
       
);

wire [7:0] o_wave;
wire            lpf_wave_v;
wire [1:0]      lpf_wave_ast_source_error;
wire ast_sink_ready;

dds_1M_10M dds_1M_10M_instance(
	   .sclk    (sclk)  ,
	   .rst_n   (rst_n) ,
	   .o_wave  (o_wave)
);


fir_lpf fir_lpf_instance (
		.clk            (sclk)    ,              //                     clk.clk
		.reset_n        (rst_n)   ,          //                     rst.reset_n
		.coeff_in_clk   (sclk)    ,      //             coeff_clock.clk
		.coeff_in_areset(rst_n)   , //             coeff_reset.reset_n
		.ast_sink_data  (o_wave),    //   avalon_streaming_sink.data
		.ast_sink_ready (ast_sink_ready),   //                        .ready
		.ast_sink_valid (1'b1),   //                        .valid
		.ast_sink_error (2'b00),    //                        .error
		.ast_source_data (lpf_wave),  // avalon_streaming_source.data
		.ast_source_ready (1'b1),//                        .ready
		.ast_source_valid (lpf_wave_v), //                        .valid
		.ast_source_error  (lpf_wave_ast_source_error)//                        .error
	);

endmodule 