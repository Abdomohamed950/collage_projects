function [expT] = in_LOG_EXP(image)
[H,W,L]=size(image);
result=zeros(H,W,L);
image=im2double(image);
result=im2double(result);
for i=1:H
    for j=1:W
        if L==3
            result(i,j,1)=2*log(image(i,j,1)+1);
            result(i,j,2)=2*log(image(i,j,2)+1);
            result(i,j,3)=2*log(image(i,j,3)+1);
        else
            result(i,j)=2*log(image(i,j)+1);
        end
    end
end
for i=1:H
    for j=1:W
         E(i,j) = exp(result(i,j));
    end
end
expT= E;
imshow(expT,[]); 
end

