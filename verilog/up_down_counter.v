module up_down_counter(q,up,down,led_empty,led_full,clk,reset,dis);
  input up,down,clk,reset;
output reg led_full , led_empty; 
output reg[3:0]q =0 , dis; //register
// down counter
always @(posedge clk)
begin
  if(reset)
	begin
    q<=4'b0;
    led_full=0;  
    led_empty = 1;
    dis=4'b1010;
  end
else
  begin
if(up==0 & q<7)
begin
    q=q+1;
	if(q==4'b0111)
	begin
	 led_full=1;  
   led_empty = 0;
   dis=4'b1100;
  end
else
	begin
	 led_full=0;  
led_empty = 0;
dis=4'b1101;
  end
end 

else if(down==0 & q>0)
  begin	
    q=q-1;
	if(q==4'b0)
	begin
	 led_full=0;  
   led_empty = 1;
   dis=4'b1010;
  end
else
	begin
	 led_full=0;  
   led_empty = 0;
   dis=4'b1101;
  end
	
end 
end
end
endmodule





module test();
reg clk,reset,up,down;
wire [3:0] q , dis;
wire led_empty,led_full;


up_down_counter dut(q,up,down,led_empty,led_full,clk,reset,dis);
  


initial 
begin
clk=1'b0;
forever #30 clk=~clk;
end
initial 
begin
up=1'b0; down =1'b1;

#40 reset=1'b1;
#10 reset=1'b0;
#20 up=1'b0; down=1'b1;

end
endmodule
