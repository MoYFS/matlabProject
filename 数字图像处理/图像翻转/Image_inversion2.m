close all;clc;clear;
img=imread('test.png');
subplot(1,4,1);
imshow(img)
title("原图")
[a,b,c]=size(img)
img1(:,1:b,:)=img(:,b:-1:1,:);
subplot(1,4,2);
imshow(img1)
title("lr")
img2(1:a,:,:)=img(a:-1:1,:,:);
subplot(1,4,3);
imshow(img2)
title("up")
img3(1:a,1:b,:)=img(a:-1:1,b:-1:1,:);
subplot(1,4,4);
imshow(img3)
title("dim")