library verilog;
use verilog.vl_types.all;
entity mid_project is
    port(
        sw              : in     vl_logic_vector(2 downto 0);
        up              : in     vl_logic;
        down            : in     vl_logic;
        sev1            : out    vl_logic_vector(6 downto 0);
        sev2            : out    vl_logic_vector(6 downto 0);
        sev3            : out    vl_logic_vector(6 downto 0);
        led0            : out    vl_logic;
        led7            : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end mid_project;
