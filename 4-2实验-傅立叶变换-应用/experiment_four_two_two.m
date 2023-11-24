clear
clc
close all
P=imread('lena.jpg'); %读入待处理图像，可以是彩色图像，也可以是灰度图像
P_1=P(:,:,1); %分别取出图像的第 1，2,3 层，参考上图！
P_2=P(:,:,2);
P_3=P(:,:,3);
N=10; %压缩参数，可以试试 5,10,100 等看看效果
%第 1 层压缩
P1=dct2(P_1); %对图像进行 DCT 变换
P2=P1;
P1(abs(P1)<N)=0; %DCT 系数压缩
I1=idct2(P1); %DCT 逆变换
%第 2 层压缩
P1=dct2(P_2); %对图像进行 DCT 变换
P2=P1;
P1(abs(P1)<N)=0; %DCT 系数压缩
I2=idct2(P1); %DCT 逆变换
%第 3 层压缩
P1=dct2(P_3); %对图像进行 DCT 变换
P2=P1;
P1(abs(P1)<N)=0; %DCT 系数压缩
I3=idct2(P1); %DCT 逆变换
%将 1,2,3 层合成为一张图片
I=P;
I(:,:,1)=I1;
I(:,:,2)=I2;
I(:,:,3)=I3;
figure(),
subplot(121),imshow(P),title('原图像');
subplot(122),imshow(uint8(I)),title('DCT 逆变换后的压缩图像');
imwrite(uint8(I),['4-2实验-傅立叶变换-应用/lena',num2str(N),'.jpg']); %读入待处理图像