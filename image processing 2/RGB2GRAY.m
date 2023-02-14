function [gray] = RGB2GRAY(RGB,op)
[H,W,L]=size(RGB);
gray=zeros(H,W);
gray=double(gray);
if(L>1)
    
 for i=1:H
  for j=1:W
    if op==1
       gray(i,j)=(0.299*RGB(i,j,1))+(0.587*RGB(i,j,2)) + (0.114*RGB(i,j,3));
    end
     if op==2
       gray(i,j)=(RGB(i,j,1))+(RGB(i,j,2)) + (RGB(i,j,3))/3;
     end
    
  end
  
 end
 gray=uint8(gray);
 end
