library verilog;
use verilog.vl_types.all;
entity mealy is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        A               : in     vl_logic;
        k               : out    vl_logic
    );
end mealy;
