clc
clear;
%im =imread('butterfly_GT.bmp');
im =imread('butterfly_GT.bmp');
[rows,cols,a] =  size(im);
factor  = 3;
x   =    210;
y   =    90;%115
stride = 30;
Line1 =1;
Line2=2;
im_crop=im(x:x+stride, y:y+stride,:);%set the (x,y) and stride yourself.
im_crop_large=imresize(im_crop, factor, 'nearest') ; %set the  factor yourself.
[hei,wid,dep] = size(im_crop_large); 
im(1:hei, end-wid+1: end, :) = im_crop_large;
if a==1
 r=zeros(rows,cols);
 g=zeros(rows,cols);
 b=zeros(rows,cols);
 r=double(im);
 g=double(im);
 b=double(im);
 im=uint8(cat(3,r,g,b));
end
[state1,result]=draw_rect(im,[x,y],[stride,stride],Line1,0);
%[state,result]=draw_rect(result,[rows-hei+1,cols-wid+1],[stride*factor+Line2,stride*factor+Line2],Line2,1);
[state,result]=draw_rect(result,[1,cols-wid+1],[stride*factor+Line2,stride*factor+Line2],Line2,1);
%imwrite(result,'2_WNNM_5_200_fac_3_stride_30.png');


 
