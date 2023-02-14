module t_count(s,tcount); 
  input [2:0] s; 
  output [1:0]tcount; 
  assign tcount=s[0]+s[1]+s[2]; 
endmodule 
