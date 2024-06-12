clc;close all;clear;
Image=rgb2gray(imread('test.png'));
subplot(1,2,1),imshow(Image);
T=graythresh(Image);result=im2bw(Image,T);
subplot(1,2,2),imshow(result);