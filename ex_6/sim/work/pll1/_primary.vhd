library verilog;
use verilog.vl_types.all;
entity pll1 is
    port(
        inclk0          : in     vl_logic;
        c0              : out    vl_logic;
        c1              : out    vl_logic;
        locked          : out    vl_logic
    );
end pll1;
