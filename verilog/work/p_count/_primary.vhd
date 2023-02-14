library verilog;
use verilog.vl_types.all;
entity p_count is
    port(
        set             : in     vl_logic;
        clear           : in     vl_logic;
        num             : out    vl_logic_vector(3 downto 0);
        led0            : out    vl_logic;
        led7            : out    vl_logic
    );
end p_count;
