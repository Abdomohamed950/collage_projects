function [log_img]=logfn(img)
image = im2double(img);
log_img=image;
factor =3; 
[r,c] = size(image);
        
for i=1:r
   for j=1:c
      log_img(i,j) = factor*log(1+image(i,j)) ;   
   end
end
end