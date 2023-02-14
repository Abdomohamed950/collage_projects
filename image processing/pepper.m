function [noiseimage]=pepper( I,p )

[w,h,l]=size(I);
noiseimage=I;
np=p*w*h;
np=uint8(np);
figure,imshow(I);
for k=1:l
for i=1:np    
    x=randi(w,1,1);
    y=randi(h,1,1);
    noiseimage(x,y,k)=0;    
end
end
figure,imshow(noiseimage);
end
