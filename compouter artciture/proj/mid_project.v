//s1,s2,s3 -----> is the swithes as input of the tellers  
//clear , set ------>is the input of person counter 
//sev1------> is the seven segmants disblay of pcount 
//sev2,sev3 ------> is the seven segmants disblays of wcount 
//led0,led7 ------> is the alarm leds of persons 
module mid_project(sw,up,down,sev1,sev2,sev3,led0,led7,clk , reset); 
  input [2:0] sw; 
  input up,down ,reset,clk; 
  output [6:0]sev1,sev2,sev3; 
  output led0, led7; 
  wire [1:0]t; 
  wire [3:0]n; 
  wire [4:0]w; 
  wire [3:0] digit1 =w%10; 
  wire [3:0] digit2 =w/10; 
  wire clkhz,debounced_up,debounced_down,debouncing_clk;
t_count opj1 (sw,t); 
up_down_counter opj2(n,up,down,led0,led7,debouncing_clk,reset);
rom opj3 (n,t,w); 
sevenSegments_decoder opj4 (n,sev1); 
sevenSegments_decoder opj5 (digit1,sev2); 
sevenSegments_decoder opj6 (digit2,sev3); 
clock_divider opj7(clk,reset,clkhz);
flip_flop debouncing_up(clkhz,up,debounced_up);
flip_flop debouncing_down(clkhz,down,debounced_down);
debounced_clk counter_clk(debounced_up,debounced_down,debouncing_clk);
endmodule