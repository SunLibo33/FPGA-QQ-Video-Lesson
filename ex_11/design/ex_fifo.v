module ex_fifo(
       input wire w_clk,
       input wire r_clk,
       input wire rst_n,
       
       input wire        w_en,
       input wire [7:0]  w_data,
       output wire       w_full,
       input wire        r_en,
       output wire [7:0] r_data,
       output wire       r_empty
);

wire [8:0]r_gaddr;
wire [8:0]w_gaddr;
wire [7:0]w_addr; 
wire [7:0]r_addr;

w_ctrl w_ctrl_instance(
       .w_clk  (w_clk  ),
       .rst_n  (rst_n  ),
       .w_en   (w_en   ),
       .r_gaddr(r_gaddr),
       .w_full (w_full ),
       .w_addr (w_addr ),
       .w_gaddr(w_gaddr)
);

fifomem fifomem_instance(
       .w_clk   (w_clk),
       .r_clk   (r_clk),
       .w_en    (w_en),
       .w_full  (w_full),
       .w_data  (w_data),
       .w_addr  (w_addr),
       .r_empty (r_empty),
       .r_addr  (r_addr),
       .r_data  (r_data)    
);

r_ctrl r_ctrl_instance(
        .r_clk  (r_clk) ,
        .rst_n  (rst_n) ,
        .r_en   (r_en) ,
        .w_gaddr(w_gaddr) ,
        .r_empty(r_empty) ,
        .r_addr (r_addr) ,
        .r_gaddr(r_gaddr)
);

endmodule 