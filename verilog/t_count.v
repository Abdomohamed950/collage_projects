module t_count(s,tcount); 
  input [2:0] s; 
  output [1:0]tcount; 
  assign tcount=s[0]+s[1]+s[2]; 
endmodule 


module t_count_dut(); 
  reg [2:0] s; 
  wire [1:0]tcount; 
  initial 
  begin
    s[0]=1; s[1]=0; s[2]=0; #100;
    s[0]=1; s[1]=1; s[2]=0; #100;
    s[0]=1; s[1]=1; s[2]=1; #100;
    s[0]=0; s[1]=0; s[2]=0; #100;
  end
  t_count a(s,tcount); 
endmodule 