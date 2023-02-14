function [output_image]=MinFilter(img)

image1= rand(size(img));
img(image1(:)>0.95)=255;
sto=[];
[a,b,c]=size(img);
output_image=zeros(a,b,c);
for h=1:c
for i=2:a-1
    for j=2:b-1
        sto=[img(i-1,j-1,h),img(i-1,j,h),img(i-1,j+1,h),img(i,j-1,h),img(i,j,h),img(i,j+1,h),img(i+1,j-1,h),img(i+1,j,h),img(i+1,j+1,h)];
        es=min(sto);
        output_image(i,j,h)=es;
        sto=[];
    end
end
end
output_image=uint8(output_image);
end