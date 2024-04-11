close all;clc;clear
img=imread("test.png");
imgG2B=img;imgR2B=img;imgR2G=img;
imgG2B(:,:,2)=img(:,:,3);
imgG2B(:,:,3)=img(:,:,2);
imgR2G(:,:,1)=img(:,:,2);
imgR2G(:,:,2)=img(:,:,1);
imgR2B(:,:,1)=img(:,:,3);
imgR2B(:,:,3)=img(:,:,1);
subplot(2,2,1); imshow(img);
subplot(2,2,2); imshow(imgG2B);
subplot(2,2,3); imshow(imgR2B);
subplot(2,2,4); imshow(imgR2G);