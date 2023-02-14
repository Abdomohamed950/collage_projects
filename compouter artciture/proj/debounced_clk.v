module debounced_clk(debounced_up,debounced_down,debouncing_clk);
input debounced_up,debounced_down;
output debouncing_clk;

  assign debouncing_clk=~debounced_up|~debounced_down;
  
endmodule