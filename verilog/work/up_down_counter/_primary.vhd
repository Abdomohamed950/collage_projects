library verilog;
use verilog.vl_types.all;
entity up_down_counter is
    port(
        q               : out    vl_logic_vector(3 downto 0);
        up              : in     vl_logic;
        down            : in     vl_logic;
        led_empty       : out    vl_logic;
        led_full        : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end up_down_counter;
