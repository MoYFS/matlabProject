close all;clc;clear;
img=imread('test.png');
subplot(1,4,1);
imshow(img)
title("原图")
img1=fliplr(img);
subplot(1,4,2);
imshow(img1)
title("lr")
img2=flipud(img);
subplot(1,4,3);
imshow(img2)
title("up")
img3=flipud(fliplr(img));
subplot(1,4,4);
imshow(img3)
title("dim")


