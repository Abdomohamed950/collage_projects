function [ NI ] = ideal_h(I,D,index)
     [H W L]=size(I);
     filter=zeros(H,W,L);
     for j=1:H
        for k=1:W
             dist=sqrt((j-(H/2)).^2+(k-(W/2)).^2);
             if(dist<=D)
                filter(j,k)=1;
             
             end    
        end    
     end
     if(index==1)
	filter=1-filter;
     else
         filter=filter;
     end    
    %%%%%%%%%%%%%%%%%%
    fi=fft2(I);
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