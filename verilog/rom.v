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
