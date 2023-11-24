clc;
clear;
close all;
P=imread('lena.jpg');
P_1=P(:,:,1);
P_2=P(:,:,2);
P_3=P(:,:,3);
P1=P;
P1(:,:,1)=0;
P1(:,:,2)=0;
figure;
subplot(2,2,1);imshow(P_1);title('R分量');
subplot(2,2,2);imshow(P_2);title('G分量');
subplot(2,2,3);imshow(P_3);title('B分量');
subplot(2,2,4);imshow(P);title('原图');
figure;
subplot(1,2,1);imshow(P);title('原图');
subplot(1,2,2);imshow(P1);title('新图像')