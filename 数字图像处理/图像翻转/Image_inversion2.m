close all;clc;clear;
img=imread('test.png');
subplot(1,4,1);
imshow(img)
title("原图")
a=size(img)
img1(1:a(1),1:a(2),:)=img(1:a(1),a(2):-1:1,:);
subplot(1,4,2);
imshow(img1)
title("lr")
img2(1:a(1),1:a(2),:)=img(a(1):-1:1,1:a(2),:);
subplot(1,4,3);
imshow(img2)
title("up")
img3(1:a(1),1:a(2),:)=img(a(1):-1:1,a(2):-1:1,:);
subplot(1,4,4);
imshow(img3)
title("dim")