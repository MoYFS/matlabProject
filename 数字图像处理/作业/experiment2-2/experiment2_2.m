close all;clc;clear;
img=imread("test.png");
gray=rgb2gray(img);
binaryImag0_5=im2bw(gray,0.5);
binaryImag0_7=im2bw(gray,0.7);
subplot(2,2,1);imshow(img);
subplot(2,2,2);imshow(gray)
subplot(2,2,3);imshow(binaryImag0_5)
subplot(2,2,4);imshow(binaryImag0_7)