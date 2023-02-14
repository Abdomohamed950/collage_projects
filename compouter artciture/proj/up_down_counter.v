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