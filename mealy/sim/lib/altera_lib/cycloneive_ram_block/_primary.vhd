library verilog;
use verilog.vl_types.all;
entity cycloneive_ram_block is
    generic(
        operation_mode  : string  := "single_port";
        mixed_port_feed_through_mode: string  := "dont_care";
        ram_block_type  : string  := "auto";
        logical_ram_name: string  := "ram_name";
        init_file       : string  := "init_file.hex";
        init_file_layout: string  := "none";
        data_interleave_width_in_bits: integer := 1;
        data_interleave_offset_in_bits: integer := 1;
        port_a_logical_ram_depth: integer := 0;
        port_a_logical_ram_width: integer := 0;
        port_a_first_address: integer := 0;
        port_a_last_address: integer := 0;
        port_a_first_bit_number: integer := 0;
        port_a_data_out_clear: string  := "none";
        port_a_data_out_clock: string  := "none";
        port_a_data_width: integer := 1;
        port_a_address_width: integer := 1;
        port_a_byte_enable_mask_width: integer := 1;
        port_b_logical_ram_depth: integer := 0;
        port_b_logical_ram_width: integer := 0;
        port_b_first_address: integer := 0;
        port_b_last_address: integer := 0;
        port_b_first_bit_number: integer := 0;
        port_b_address_clear: string  := "none";
        port_b_data_out_clear: string  := "none";
        port_b_data_in_clock: string  := "clock1";
        port_b_address_clock: string  := "clock1";
        port_b_write_enable_clock: string  := "clock1";
        port_b_read_enable_clock: string  := "clock1";
        port_b_byte_enable_clock: string  := "clock1";
        port_b_data_out_clock: string  := "none";
        port_b_data_width: integer := 1;
        port_b_address_width: integer := 1;
        port_b_byte_enable_mask_width: integer := 1;
        port_a_read_during_write_mode: string  := "new_data_no_nbe_read";
        port_b_read_during_write_mode: string  := "new_data_no_nbe_read";
        power_up_uninitialized: string  := "false";
        lpm_type        : string  := "cycloneive_ram_block";
        lpm_hint        : string  := "true";
        connectivity_checking: string  := "off";
        mem_init0       : integer := 0;
        mem_init1       : integer := 0;
        mem_init2       : integer := 0;
        mem_init3       : integer := 0;
        mem_init4       : integer := 0;
        port_a_byte_size: integer := 0;
        port_b_byte_size: integer := 0;
        safe_write      : string  := "err_on_2clk";
        init_file_restructured: string  := "unused";
        clk0_input_clock_enable: string  := "none";
        clk0_core_clock_enable: string  := "none";
        clk0_output_clock_enable: string  := "none";
        clk1_input_clock_enable: string  := "none";
        clk1_core_clock_enable: string  := "none";
        clk1_output_clock_enable: string  := "none";
        port_a_address_clear: string  := "none";
        port_a_data_in_clock: string  := "clock0";
        port_a_address_clock: string  := "clock0";
        port_a_write_enable_clock: string  := "clock0";
        port_a_byte_enable_clock: string  := "clock0";
        port_a_read_enable_clock: string  := "clock0"
    );
    port(
        portadatain     : in     vl_logic_vector;
        portaaddr       : in     vl_logic_vector;
        portawe         : in     vl_logic;
        portare         : in     vl_logic;
        portbdatain     : in     vl_logic_vector;
        portbaddr       : in     vl_logic_vector;
        portbwe         : in     vl_logic;
        portbre         : in     vl_logic;
        clk0            : in     vl_logic;
        clk1            : in     vl_logic;
        ena0            : in     vl_logic;
        ena1            : in     vl_logic;
        ena2            : in     vl_logic;
        ena3            : in     vl_logic;
        clr0            : in     vl_logic;
        clr1            : in     vl_logic;
        portabyteenamasks: in     vl_logic_vector;
        portbbyteenamasks: in     vl_logic_vector;
        portaaddrstall  : in     vl_logic;
        portbaddrstall  : in     vl_logic;
        devclrn         : in     vl_logic;
        devpor          : in     vl_logic;
        portadataout    : out    vl_logic_vector;
        portbdataout    : out    vl_logic_vector
    );
end cycloneive_ram_block;
