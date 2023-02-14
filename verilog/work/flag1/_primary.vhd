library verilog;
use verilog.vl_types.all;
entity flag1 is
    port(
        count           : in     vl_logic_vector(3 downto 0);
        led1            : out    vl_logic
    );
end flag1;
