clc;
close all;
Image=imread('flower608.jpg');
grayI=rgb2gray(Image);
DFTI1=fft2(grayI);
ADFTI1=abs(DFTI1);
top=max(ADFTI1(:));
bottom=min(ADFTI1(:));
ADFTI1=(ADFTI1-bottom)/(top-bottom)*100;%max-min归一化处理，使数值在[0~100]
ADFTI2=fftshift(ADFTI1);
subplot(131),imshow(Image),title('原图');
subplot(132),imshow(ADFTI1),title('原频谱图');
subplot(133),imshow(ADFTI2),title('移位频谱图');