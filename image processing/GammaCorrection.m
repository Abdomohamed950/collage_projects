function [image2]=GammaCorrection(img)
image1=double(img);
[m,n,o]= size(image1);
image2=[];
gamma = 1.5; 
for l=1:o
    for i=1:m
        for j=1:n
            image2(i,j,l)= image1(i,j,l)^gamma; 
        end
    end
end

image2 = uint8(image2);
end