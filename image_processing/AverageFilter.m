function [ filtered_img]=AverageFilter(img)
[m,n] = size(img);
modify=padarray(img,[floor(m/2),floor(n/2)]);
filtered_img = zeros(m,n);
med_indx = round((m*n)/2);
for i = 1:size(modify,1)-(m-1)
    for j = 1:size(modify,2)-(n-1)
       temp = modify(i:i+(m-1),j:j+(n-1));
         filtered_img(i,j) = median(temp(:));
    end
end
filtered_img = uint8(filtered_img);
figure,imshow(filtered_img);
