function [image]=Correlation(img)
filter =  1/49 *[1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1; 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1; 1 1 1 1 1 1 1];
image = imfilter(img,filter);
end