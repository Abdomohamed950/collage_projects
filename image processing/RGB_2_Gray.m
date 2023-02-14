function [gray_image]=RGB_2_Gray(img)
[W,H,L]=size(img);
        x=zeros(W,H);
        gray_image=double(x);
       
        for i=1:W
            for j=1:H
                gray_image(i,j) = .2*img(i,j,1)+.5*img(i,j,2)+.1*img(i,j,3);
            end
        end
        
        gray_image=uint8(gray_image);
        
end   