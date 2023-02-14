function [ ] = MidPoint(img)
[r,c,l]=size(img);
if l==1
    noisy_img=imnoise(img,'gaussian');
paddedimage2=padarray(img,[1,1]);
[r,c]=size(paddedimage2);
 
for i=2:r-1
    for j=2:c-1
        out=[paddedimage2(i-1,j-1),paddedimage2(i-1,j),paddedimage2(i-1,j+1),paddedimage2(i,j-1),paddedimage2(i,j),paddedimage2(i,j+1),paddedimage2(i-1,j),paddedimage2(i+1,j-1),paddedimage2(i+1,j),paddedimage2(i+1,j+1)];
       a=max(out);
       b=min(out);
        outimage(i,j)=(a+b)/2;
    end
end
u=outimage;
imshow(u);
else
    
gray_img=im2double(rgb2gray(img));
noisy_img=imnoise(gray_img,'gaussian');
paddedimage2=padarray(gray_img,[1,1]);
[r,c]=size(paddedimage2);
 
for i=2:r-1
    for j=2:c-1
        out=[paddedimage2(i-1,j-1),paddedimage2(i-1,j),paddedimage2(i-1,j+1),paddedimage2(i,j-1),paddedimage2(i,j),paddedimage2(i,j+1),paddedimage2(i-1,j),paddedimage2(i+1,j-1),paddedimage2(i+1,j),paddedimage2(i+1,j+1)];
       a=max(out);
       b=min(out);
        outimage(i,j)=(a+b)/2;
    end
end
u=outimage;
imshow(u);
end
end

