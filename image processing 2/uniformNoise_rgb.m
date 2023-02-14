function  [ni]=uniformNoise_rgb( img,a,b,perc )
%figure,imshow(RGB),title('orignal');
R1=uniformNoise(img(:,:,1),a,b,perc );
G1=uniformNoise(img(:,:,2),a,b,perc);
B1=uniformNoise(img(:,:,3),a,b,perc );
ni=cat(3,uint8(R1),uint8(G1),uint8(B1));
imshow(ni);
end
