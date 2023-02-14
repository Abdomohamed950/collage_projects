library verilog;
use verilog.vl_types.all;
entity flip_flop is
    port(
        clk             : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
end flip_flop;
