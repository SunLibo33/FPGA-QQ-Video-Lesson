library verilog;
use verilog.vl_types.all;
entity stratixv_local_clk_divider is
    generic(
        clk_divide_by   : integer := 1
    );
    port(
        clkin           : in     vl_logic;
        lloaden         : out    vl_logic
    );
end stratixv_local_clk_divider;
