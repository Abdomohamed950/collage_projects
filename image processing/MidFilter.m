function [new_img]=MidFilter(img)
[H,W,L]=size(img);
img=double(img);
copy=zeros(3 ,3);
new_img=zeros(H,W,L);
X=floor(3/2);
Y=floor(3/2);
for i=1:H-3 
 for j=1:W-3
  for m=1:L
   for k=1:3
        for l=1:3
         copy(k,l)=img(i+k-1,j+l-1,m) ;
        end
   end
     new_img(i+X,j+Y,m)=(min(copy(:))+max(copy(:)))/2;
  end
 end 
end
new_img=uint8(new_img);
end