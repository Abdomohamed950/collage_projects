function [ ] =Correlation_m(image)
image=[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0];
filter=[1 2 3 4 5 6 7 8 9 ];

%filter=double(filter);
p=1;
image=double(padarray(image,[p p]));

[h,w,l]=size(image);
new_img=zeros(h,w,l);
image
for i=2:h-1
      for j=2:w-1
        sum1=0;
        s=image(i-1:i+1,j-1:j+1);
        c=s(:)';
          new_img=immultiply(c ,filter)
         
        
         end
end
new_img   
 end






