close all;clc;clear;
image=rgb2gray(imread("test.png"));
histgram=imhist(image);    %统计图像直方图
[h w]=size(image);
NewImage1=zeros(h,w);
s=zeros(256);
s(1)=histgram(1);
for t=2:256
    s(t)=s(t-1)+histgram(t);  %计算新的灰度值    
end
for x=1:w
    for y=1:h
        NewImage1(y,x)=s(image(y,x)+1)/(w*h);                 %生成新图像
   end
end
NewImage2=histeq(image,256);%调用Matlab函数
subplot(2,3,1);imshow(image);title('灰度图像');
subplot(2,3,4);imhist(image);
title('灰度图像的直方图'); axis tight;
subplot(2,3,2);imshow(NewImage1);title('全局直方图均衡化');
subplot(2,3,5);imhist(NewImage1);
title('全局直方图均衡化的直方图');axis tight;
subplot(2,3,3);imshow(NewImage2);title('函数全局均衡化');
subplot(2,3,6);imhist(NewImage2);
title('函数全局均衡化直方图');axis tight;
