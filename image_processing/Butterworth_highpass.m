function [ NI ] = GAUSSIAN_lowpass( img,D0 )
img=imread('cameraman.tif');
D0=20;
[H, W, L]=size(img);
filter=zeros(H,W,L);
 for x=1:H
    for y=1:W
        %D(u,v)===distance to center
        dis=sqrt((x-(H/2)).^2+(y-(W/2)).^2);
        p=(((-dis)^2)/(2*(D0)^2));
        e=2.718281828;
        filter(x,y)=((e)^p);
        if(dis<=D0)
            filter(x,y)=1;
        else
            filter(x,y)=0;
        end
    end
 end
  
  %DFT
  a=fft2(img);
  a=fftshift(a);
  %compute real part alone and imagin alone
  reall=real(a);
  imagin=imag(a);
  %multipply each part by filter
  nreal=filter.*reall;
  nimag=filter.*imagin;
  %%%
  NI=nreal(:,:)+i*nimag(:,:);
  %Inverse FT
  NI=fftshift(NI);
  NI=ifft2(NI);
  NI=abs(NI);
  NI=log(NI);
  NI=mat2gray(NI);


imshow(NI);
end