function [binaryImg]=RGB_2_Binary(img) 
[W,H,L]=size(img);
        x=zeros(W,H);
        gray=double(x);
        binaryImg=double(x);
        
        for i=1:W
            for j=1:H
                gray(i,j) = .2*img(i,j,1)+.5*img(i,j,2)+.1*img(i,j,3);
                
                if gray(i,j)>100
                    binaryImg(i,j)=1;
                else
                    binaryImg(i,j)=0;
                end
            end
        end
end
        