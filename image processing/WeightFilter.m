function [image1]=WeightFilter(img)
mask = [1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];
image1 = imfilter(img , mask);
end