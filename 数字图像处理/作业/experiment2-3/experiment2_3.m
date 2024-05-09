close all;clc;clear;
image=imread('test1.png');
subplot(1,3,1),imshow(image)
imageHSV=rgb2hsv(image);
subplot(1,3,2),imshow(imageHSV);
imageYCbCr=rgb2ycbcr(image);
subplot(1,3,3),imshow(imageYCbCr)