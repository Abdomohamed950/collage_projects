function [ result ] = RayLeigh_Noise( image,a,b )
[H W L]=size(image);
for i = 1:255
    pixels=round(((2/b)*(i-a)*(exp(((i-a).^2)/b)))*H*W);
    for j = 1 :pixels
        r=ceil(round(1,1)*H);
        c=ceil(round(1,1)*W);
        image(r,c)=image(r,c)+i;
    end
end
result=contrast_stretcing(image);
result=uint8(result);
end