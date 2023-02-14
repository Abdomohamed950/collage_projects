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
module up_down_counter(q,up,down,led_empty,led_full,clk,reset);
  input up,down,clk,reset;
output [3:0]q; 
output reg led_full , led_empty; 
reg[3:0]q; //register
// down counter
always @(posedge clk)
begin
if(up==0 && q<7)
begin
  if(reset)
	begin
    q<=4'b0;
 led_full=0;  
led_empty = 1;
end
  else
	begin
    q=q+1;
	if(q==4'b0111)
	begin
	 led_full=1;  
led_empty = 0;
end
else
	begin
	 led_full=0;  
led_empty = 0;
end
	end
end 

else if(down==0 && q>0)
  begin
   if(reset)
	begin
    q<=4'b0;
 led_full=0;  
led_empty = 1;
end
else
	begin
    q=q-1;
	if(q==4'b0)
	  begin
	 led_full=0;  
led_empty = 1;
end
else
	begin
	 led_full=0;  
led_empty = 0;
end
	end
end 
end
endmodule
module t_count(s,tcount); 
  input [2:0] s; 
  output [1:0]tcount; 
  assign tcount=s[0]+s[1]+s[2]; 
endmodule 
module sevenSegments_decoder (bcd,dec); 
input [3:0]bcd; 
output reg [6:0] dec; 
always@(*) 
begin 
   case(bcd) 
 
    4'b0000 : dec = ~7'b1111110; // 0 
    4'b0001 : dec = ~7'b0110000; // 1 
    4'b0010 : dec = ~7'b1101101; // 2 
    4'b0011 : dec = ~7'b1111001; // 3 
    4'b0100 : dec = ~7'b0110011; // 4 
    4'b0101 : dec = ~7'b1011011; // 5 
    4'b0110 : dec = ~7'b1011111; // 6 
    4'b0111 : dec = ~7'b1110000; // 7 
    4'b1000 : dec = ~7'b1111111; // 8     
    4'b1001 : dec = ~7'b1111011; // 9     
     
 
   endcase  
   end 
endmodule 
module rom (pcount,tcount,wtime); 
  input [3:0]pcount ; 
  input [1:0] tcount; 
  output reg[4:0]wtime; 
  always@(*) 
  begin 
 if(tcount==2'b01) 
  begin 
    case(pcount) 
    4'b0000 : wtime <= 5'b00000; 
    4'b0001 : wtime <= 5'b00011; 
    4'b0010 : wtime <= 5'b00110; 
    4'b0011 : wtime <= 5'b01001; 
    4'b0100 : wtime <= 5'b01100; 
    4'b0101 : wtime <= 5'b01111; 
    4'b0110 : wtime <= 5'b10010; 
    4'b0111 : wtime <= 5'b10101;     
  endcase 
  end 
else if(tcount==2'b10) 
  begin 
    case(pcount) 
    4'b0000 : wtime <= 5'b00000; 
    4'b0001 : wtime <= 5'b00011; 
    4'b0010 : wtime <= 5'b00100; 
    4'b0011 : wtime <= 5'b00110; 
    4'b0100 : wtime <= 5'b00111; 
    4'b0101 : wtime <= 5'b01001; 
    4'b0110 : wtime <= 5'b01010; 
    4'b0111 : wtime <= 5'b01100;     
  endcase 
  end 
  if(tcount==2'b11) 
  begin 
    case(pcount) 
    4'b0000 : wtime <= 5'b00000; 
    4'b0001 : wtime <= 5'b00011; 
    4'b0010 : wtime <= 5'b00100; 
    4'b0011 : wtime <= 5'b00101; 
    4'b0100 : wtime <= 5'b00110; 
    4'b0101 : wtime <= 5'b00111; 
    4'b0110 : wtime <= 5'b01000; 
    4'b0111 : wtime <= 5'b01001;     
  endcase 
  end 
end 
endmodule 
module flag1(count,led1);
  input [3:0]count;
  output reg led1;
  always @(*)
  begin
    	case(count)

    4'b0000 : led1 <= 1; 
    4'b0001 : led1<=0;
    4'b0010 : led1<=0;
    4'b0011 : led1<=0;
    4'b0100 : led1<=0;
    4'b0101 : led1<=0;
    4'b0110 : led1<=0;
    4'b0111 : led1 <= 1;      
  endcase 

	

  end
endmodule

module flip_flop(clk,d,q);
  input clk ,d;
  output reg q;
  always@(posedge clk)
    q<=d;
endmodule
module debounced_clk(debounced_up,debounced_down,debouncing_clk);
input debounced_up,debounced_down;
output debouncing_clk;

  assign debouncing_clk=~debounced_up|~debounced_down;
  
endmodule
module clock_divider(clk,reset,clkhz);
input reset,clk;
output reg clkhz;
reg[24:0]count;
always @(posedge clk or posedge reset)
begin
if(reset)
begin
count<=0;
clkhz<=0;
end
else
begin
if(count<1_000_000) 
count<=count+1;
else
begin
clkhz<=~clkhz;
count<=0;
end
end
end
endmodule
module test();

reg clk,reset,updown,dow;

reg [3:0] pcount;

reg [1:0]tcount; 
 wire [4:0]w; 
wire [6:0] seg1,seg2,seg3;
wire [3:0] digit1 =w%10; 
wire [3:0] digit2 =w/10;
 wire led1,led2;
wire led;

initial 
begin
clk=1'b0;
forever #30 clk=~clk;
end
initial 
begin
updown=1'b0; 
dow=1'b0;
#40 reset=1'b1;
#10 reset=1'b0;
#20 updown=1'b1;
#20 dow=1'b0;
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
mid_project test0(tcount,updown,dow,seg1,seg2,seg3,led1,led2,clk,reset);
flag1 test1(pcount,led);



 
rom test3(pcount,tcount,w);
sevenSegments_decoder test4(pcount,seg1);
sevenSegments_decoder test5(digit1,seg2);
sevenSegments_decoder test6(digit2,seg3);
endmodule
