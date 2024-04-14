close all;clc;clear;
image=imread("test.png");
N=200;
P1=dct2(image(:,:,1)); P1(abs(P1)<N)=0;I1=idct2(P1);
P1=dct2(image(:,:,2));P1(abs(P1)<N)=0;I2=idct2(P1);
P1=dct2(image(:,:,3)); P1(abs(P1)<N)=0; I3=idct2(P1);
I=image;I(:,:,1)=I1;I(:,:,2)=I2;I(:,:,3)=I3;
subplot(1,2,1);imshow(image);
subplot(1,2,2);imshow(I);