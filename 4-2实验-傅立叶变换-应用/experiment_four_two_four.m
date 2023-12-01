close all; clc
I1=imread('lena2.jpg');
J1=imread('boy1.jpg');
J1= rgb2gray(J1);%如果是灰度图就不用先变换
I1= rgb2gray(I1);%如果是灰度图就不用先变换
If = fft2(I1);Jf = fft2(J1);
% 分别求幅度谱和相位谱
FAi = abs(If);FPi = angle(If);
FAj = abs(Jf);FPj = angle(Jf);
% 交换相位谱并重建复数矩阵
IR = FAi .* cos(FPj) + FAi.* sin(FPj) .* i;
JR = FAj .* cos(FPi) + FAj.* sin(FPi) .* i;
% 傅立叶反变换
IR1= abs(ifft2(IR));JR1= abs(ifft2(JR));
% 显示图像
subplot(2,2,1);imshow(J1);
title('男孩原图像');subplot(2,2,2);
imshow(I1);title('美女原图像');
subplot(2,2,3);imshow(IR1, []);
title('男孩的幅度谱和美女的相位谱组合');
subplot(2,2,4);imshow(JR1, []);
title('美女的幅度谱和男孩的相位谱组合');