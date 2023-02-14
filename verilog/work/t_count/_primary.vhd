library verilog;
use verilog.vl_types.all;
entity t_count is
    port(
        s               : in     vl_logic_vector(2 downto 0);
        tcount          : out    vl_logic_vector(1 downto 0)
    );
end t_count;
