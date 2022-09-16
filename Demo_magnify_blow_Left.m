            clc;
            clear;
            close all;

            img = imread('butterfly_GT.bmp');
 

            [rows, cols, a] = size(img);
            factor = 3;
            x = 220; %65
            y = 120; %155
            stride = 30;
            Line1 = 1;
            Line2 = 2;
            im_crop = img(x : x + stride, y : y + stride, :);%set the (x,y) and stride yourself.
            im_crop_large = imresize(im_crop, factor, 'nearest') ; %set the  factor yourself.
            [hei, wid,dep] = size(im_crop_large);
            img(end-hei+1:end, 1:wid, :) = im_crop_large; % Left Bottom
            if a == 1
                r = double(img);
                g = double(img);
                b = double(img);
                img = uint8(cat(3, r, g, b));
            end
            [state1, result] = draw_rect(img, [x, y], [stride, stride], Line1, 0);
          
            [state, result] = draw_rect(result, [rows - hei + 1, 2],[stride * factor + Line2, stride * factor + Line2], Line2, 1); % Left Bottom
            imwrite(result,'1_Ori_220_120_fac_3_stride_30.png');
 



