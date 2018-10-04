library verilog;
use verilog.vl_types.all;
entity spi_ctrl is
    generic(
        IDLE            : integer := 1;
        \WAIT\          : integer := 2;
        READ_MEM        : integer := 4;
        WRITE_REG       : integer := 8;
        STOP            : integer := 16;
        H_DIV_CYC       : integer := 24
    );
    port(
        sclk            : in     vl_logic;
        rst_n           : in     vl_logic;
        work_en         : in     vl_logic;
        spi_clk         : out    vl_logic;
        spi_sdi         : out    vl_logic;
        spi_csn         : out    vl_logic;
        spi_sdo         : in     vl_logic;
        conf_end        : out    vl_logic
    );
end spi_ctrl;
