function [binaryImg]=Gray_2_Binary(img)
grayImg = rgb2gray(img); 
binaryImg = grayImg; 
[rows,columns] = size(grayImg);
for i = 1:rows
    for j = 1:columns
        if(binaryImg(i,j) <= 100)
            binaryImg(i,j) = 0;
        else
            binaryImg(i,j) = 255;
        end
    end
end
end