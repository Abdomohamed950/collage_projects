//s1,s2,s3 -----> is the swithes as input of the tellers  
//clear , set ------>is the input of person counter 
//sev1,sev2------> is the seven segmants disblay of pcount 
//sev3,sev4 ------> is the seven segmants disblays of wcount 
//led0,led7 ------> is the alarm leds of persons 
module mid_project(sw,up,down,sev1,sev2,sev3,sev4,led0,led7,clk , reset); 
  input [2:0] sw; 
  input up,down ,reset,clk; 
  output [6:0]sev1,sev2,sev3,sev4; 
  output led0, led7; 
  wire [1:0]t; 
  wire [3:0]n; 
  wire [4:0]w; 
  wire [3:0] digit1 =w%10; 
  wire [3:0] digit2 =w/10; 
  wire clkhz,debounced_up,debounced_down,debouncing_clk;
t_count opj1 (sw,t); 
up_down_counter opj2(n,up,down,led0,led7,debouncing_clk,reset,dis);
rom opj3 (n,t,w); 
sevenSegments_decoder opj4 (n,sev1); 
sevenSegments_decoder opj5 (dis,sev2); 
sevenSegments_decoder opj6 (digit1,sev3); 
sevenSegments_decoder opj8 (digit2,sev4); 
clock_divider opj7(clk,reset,clkhz);
flip_flop debouncing_up(clkhz,up,debounced_up);
flip_flop debouncing_down(clkhz,down,debounced_down);
debounced_clk counter_clk(debounced_up,debounced_down,debouncing_clk);
endmodule

module test11();

reg clk,reset,up,down;

reg [3:0] pcount;

reg [1:0]tcount; 
 wire [4:0]w; 
wire [6:0] seg1,seg2,seg3;
wire [3:0] digit1 =w%10; 
wire [3:0] digit2 =w/10;
 wire led1,led2;
//wire led;

initial 
begin
clk=1'b0;
forever #30 clk=~clk;
end
initial 
begin
up=1'b0; 
down=1'b0;
#40 reset=1'b1;
#10 reset=1'b0;
#20 up=1'b1;
#20 down=1'b0;
tcount=2'b01; pcount=4'b0000; #100;
tcount=2'b01; pcount=4'b0001; #100;
tcount=2'b01; pcount=4'b0010; #100;
tcount=2'b01; pcount=4'b0011; #100;
tcount=2'b01; pcount=4'b0100; #100;
tcount=2'b01; pcount=4'b0101; #100;
tcount=2'b01; pcount=4'b0110; #100;
tcount=2'b01; pcount=4'b0111; #100;
///2
tcount=2'b10;  #100;

//3
tcount=2'b11;  #100;


end
mid_project test0(tcount,up,down,seg1,seg2,seg3,led1,led2,clk,reset);
//flag1 test1(pcount,led);



 
rom test3(pcount,tcount,w);
sevenSegments_decoder test4(pcount,seg1);
sevenSegments_decoder test5(digit1,seg2);
sevenSegments_decoder test6(digit2,seg3);
endmodule


