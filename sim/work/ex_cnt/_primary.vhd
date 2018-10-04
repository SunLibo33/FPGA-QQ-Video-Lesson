library verilog;
use verilog.vl_types.all;
entity ex_cnt is
    port(
        sclk            : in     vl_logic;
        rst_n           : in     vl_logic;
        cnt             : out    vl_logic_vector(9 downto 0)
    );
end ex_cnt;
