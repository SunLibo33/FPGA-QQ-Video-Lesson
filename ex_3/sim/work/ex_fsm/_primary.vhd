library verilog;
use verilog.vl_types.all;
entity ex_fsm is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        sclk            : in     vl_logic;
        rst_n           : in     vl_logic;
        A               : in     vl_logic;
        k1              : out    vl_logic;
        k2              : out    vl_logic
    );
end ex_fsm;
