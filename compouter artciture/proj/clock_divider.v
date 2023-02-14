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
if(count<25_000_00) 
count<=count+1;
else
begin
clkhz<=~clkhz;
count<=0;
end
end
end
endmodule
module dd(clk,d,q);
input clk ,d;
output reg q;
always@(posedge clk)
q<=d;
endmodule


