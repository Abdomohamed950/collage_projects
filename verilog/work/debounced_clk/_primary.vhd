library verilog;
use verilog.vl_types.all;
entity debounced_clk is
    port(
        debounced_up    : in     vl_logic;
        debounced_down  : in     vl_logic;
        debouncing_clk  : out    vl_logic
    );
end debounced_clk;
