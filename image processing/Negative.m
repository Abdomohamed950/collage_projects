function [negative_img]=Negative(img)
image=double(img);
[w,h,l]=size(image);
negative_img=[];
   if l==1
        for i=1:w
            for j=1:h
                negative_img(i,j)=255-image(i,j);
            end
        end
   else
for i=1:w
    for j=1:h
         negative_img(i,j,3) = 255 - image(i,j,3);  
         negative_img(i,j,2) = 255 - image(i,j,2);  
         negative_img(i,j,1) = 255 - image(i,j,1);
    end
end 
   end
negative_img=uint8(negative_img);
end
