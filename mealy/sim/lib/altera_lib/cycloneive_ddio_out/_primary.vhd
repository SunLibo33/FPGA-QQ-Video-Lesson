library verilog;
use verilog.vl_types.all;
entity cycloneive_ddio_out is
    generic(
        power_up        : string  := "low";
        async_mode      : string  := "none";
        sync_mode       : string  := "none";
        use_new_clocking_model: string  := "false";
        lpm_type        : string  := "cycloneive_ddio_out"
    );
    port(
        datainlo        : in     vl_logic;
        datainhi        : in     vl_logic;
        clk             : in     vl_logic;
        clkhi           : in     vl_logic;
        clklo           : in     vl_logic;
        muxsel          : in     vl_logic;
        ena             : in     vl_logic;
        areset          : in     vl_logic;
        sreset          : in     vl_logic;
        dataout         : out    vl_logic;
        dfflo           : out    vl_logic;
        dffhi           : out    vl_logic;
        devpor          : in     vl_logic;
        devclrn         : in     vl_logic
    );
end cycloneive_ddio_out;
