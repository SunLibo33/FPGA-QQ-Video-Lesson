library verilog;
use verilog.vl_types.all;
entity SPI is
    generic(
        IDLE            : integer := 1;
        INIT            : integer := 2;
        CHECK           : integer := 4;
        READ            : integer := 8;
        WRITE           : integer := 16
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        spi_reset       : in     vl_logic;
        mosi            : in     vl_logic;
        cs_n            : in     vl_logic;
        sclk            : in     vl_logic;
        rd_data         : in     vl_logic_vector(31 downto 0);
        miso            : out    vl_logic;
        wr_en           : out    vl_logic;
        rd_en           : out    vl_logic;
        wr_addr         : out    vl_logic_vector(8 downto 0);
        rd_addr         : out    vl_logic_vector(8 downto 0);
        addr            : out    vl_logic_vector(14 downto 0);
        wr_data         : out    vl_logic_vector(31 downto 0)
    );
end SPI;
