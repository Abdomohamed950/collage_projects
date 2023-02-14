function [image1]=MeanFilter(img)
image=double(img);
filter = [1/9 1/9 1/9 ; 1/9 1/9 1/9 ; 1/9 1/9 1/9];
image1 = imfilter(image , filter);
image1 = uint8(image1);
end