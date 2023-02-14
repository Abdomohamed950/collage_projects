function [ NI ] = butter_low(img,D0,n,index)
     [H,W]=size(img);
     filter=zeros(H,W);
     for j=1:H
        for k=1:W
             dist=sqrt(((j-(H/2)).^2+(k-(W/2)).^2));
             
              
             
             if(index==0)
                 filter(j,k)=(1/(1+(dist/D0)^(2*n)));
             else
                 filter(j,k)=1-(1/(1+(dist/D0)^(2*n)));
             end
        end    
     end
        
    %%%%%%%%%%%%%%%%%%
    fi=fft2(img);
    fi=fftshift(fi);
    reall=real(fi);
    imagin=imag(fi);
    nreall=filter.*reall;
    nimagin=filter.*imagin;
    NI=nreall(:,:)+i*nimagin(:,:);
    NI=fftshift(NI);
    NI=ifft2(NI);
    NI=abs(NI);
    NI=log(NI);
    NI=mat2gray(NI);
    imshow(NI);
end