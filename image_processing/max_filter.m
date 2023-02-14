function [] = max_filter(img)
[r,w,c]=size(img);

if c==1
 A =img;
B=zeros(size(A));

modifyA=padarray(A,[1 1]);

        x=[1:3]';
        y=[1:3]';
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
      
       window=reshape(modifyA(i+x-1,j+y-1),[],1);
        B(i,j)= max(window);

    end
end
B=uint8(B);
imshow(B);
else
 A =img;
A = rgb2gray(A);
B=zeros(size(A));
modifyA=padarray(A,[1 1]);

        x=[1:3]';
        y=[1:3]';
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
      
       window=reshape(modifyA(i+x-1,j+y-1),[],1);
        B(i,j)= max(window);

    end
end

B=uint8(B);
imshow(B);
end
end



