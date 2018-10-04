library verilog;
use verilog.vl_types.all;
entity altparallel_flash_loader is
    generic(
        flash_data_width: integer := 16;
        flash_burst_extra_cycle: integer := 0;
        safe_mode_retry : integer := 1;
        us_unit_counter : integer := 1;
        burst_mode_numonyx: integer := 0;
        burst_mode      : integer := 0;
        clk_divisor     : integer := 1;
        addr_width      : integer := 20;
        tristate_checkbox: integer := 0;
        nflash_mfc      : string  := "NUMONYX";
        safe_mode_revert_addr: integer := 0;
        page_mode       : integer := 0;
        flash_ecc_checkbox: integer := 0;
        features_pgm    : integer := 1;
        auto_restart    : string  := "OFF";
        page_clk_divisor: integer := 1;
        safe_mode_halt  : integer := 0;
        flash_nreset_counter: integer := 1;
        normal_mode     : integer := 1;
        safe_mode_revert: integer := 0;
        fifo_size       : integer := 16;
        nrb_addr        : integer := 65667072;
        nand_size       : integer := 67108864;
        dclk_divisor    : integer := 1;
        rsu_watchdog_counter: integer := 100000000;
        flash_nreset_checkbox: integer := 0;
        flash_type      : string  := "CFI_FLASH";
        features_cfg    : integer := 1;
        burst_mode_intel: integer := 0;
        extra_addr_byte : integer := 0;
        option_bits_start_address: integer := 0;
        pfl_rsu_watchdog_enabled: integer := 0;
        enhanced_flash_programming: integer := 0;
        conf_wait_timer_width: integer := 14;
        lpm_type        : string  := "ALTPARALLEL_FLASH_LOADER";
        n_flash         : integer := 1;
        disable_crc_checkbox: integer := 0;
        burst_mode_spansion: integer := 0;
        qflash_mfc      : string  := "ALTERA";
        decompressor_mode: string  := "NONE";
        conf_data_width : integer := 1;
        PFL_QUAD_IO_FLASH_IR_BITS: integer := 8;
        PFL_CFI_FLASH_IR_BITS: integer := 5;
        PFL_NAND_FLASH_IR_BITS: integer := 4;
        N_FLASH_BITS    : integer := 4
    );
    port(
        flash_nce       : out    vl_logic_vector;
        fpga_data       : out    vl_logic_vector;
        fpga_dclk       : out    vl_logic;
        fpga_nstatus    : in     vl_logic;
        flash_ale       : out    vl_logic;
        pfl_clk         : in     vl_logic;
        fpga_nconfig    : out    vl_logic;
        flash_io2       : inout  vl_logic_vector;
        flash_sck       : out    vl_logic_vector;
        flash_noe       : out    vl_logic;
        flash_nwe       : out    vl_logic;
        pfl_watchdog_error: out    vl_logic;
        pfl_reset_watchdog: in     vl_logic;
        fpga_conf_done  : in     vl_logic;
        flash_rdy       : in     vl_logic;
        pfl_flash_access_granted: in     vl_logic;
        pfl_nreconfigure: in     vl_logic;
        flash_cle       : out    vl_logic;
        flash_nreset    : out    vl_logic;
        flash_io0       : inout  vl_logic_vector;
        pfl_nreset      : in     vl_logic;
        flash_data      : inout  vl_logic_vector;
        flash_io1       : inout  vl_logic_vector;
        flash_nadv      : out    vl_logic;
        flash_clk       : out    vl_logic;
        flash_io3       : inout  vl_logic_vector;
        flash_io        : inout  vl_logic_vector(7 downto 0);
        flash_addr      : out    vl_logic_vector;
        pfl_flash_access_request: out    vl_logic;
        flash_ncs       : out    vl_logic_vector;
        fpga_pgm        : in     vl_logic_vector(2 downto 0)
    );
end altparallel_flash_loader;
