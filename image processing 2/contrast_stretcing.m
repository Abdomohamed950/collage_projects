function [out_img]= contrast_stretcing(img)

[h ,w, d]=size(img);
    out_img=zeros(h,w,d);
    old_min=double(min(min(img)));
    old_max=double(max(max(img)));
    new_min=double(0);
    new_max=double(255);
    
    m=(new_max-new_min)/(old_max-old_min);
    
    for i=1 :h
        for j=1 : w
            out_img(i,j)=(img(i,j)-old_min)* m+new_min;
        end
    end
  
    out_img=uint8(out_img);
end
