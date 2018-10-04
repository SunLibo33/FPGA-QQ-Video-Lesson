library verilog;
use verilog.vl_types.all;
entity ex_case is
    port(
        rst_n           : in     vl_logic;
        sclk            : in     vl_logic;
        o_dv            : out    vl_logic;
        o_data          : out    vl_logic_vector(7 downto 0);
        i_data          : in     vl_logic_vector(9 downto 0);
        i_addr          : in     vl_logic_vector(7 downto 0)
    );
end ex_case;
