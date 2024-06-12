close all;clc;clear;
image=double((imread('test.png')));
subplot(1,2,1),imshow(uint8(image));%title('原图');
logI=log(image+1);  %对数运算
sigma=1.414;  filtersize=[7 7];  %高斯滤波器参数
lowfilter=fspecial('gaussian',filtersize,sigma);  %构造高斯低通滤波器
highfilter=zeros(filtersize);
highpara=1; lowpara=0.55;    %控制滤波器幅度范围的系数  
highfilter(ceil(filtersize(1,1)/2),ceil(filtersize(1,2)/2))=1;
highfilter=highpara*highfilter-(highpara-lowpara)*lowfilter; %高斯低通滤波器转换为高斯高通滤波器
highpart=imfilter(logI,highfilter,'replicate','conv'); %时域卷积实现滤波
NewImage=exp(highpart); %指数变换恢复图像
top=max(NewImage(:)); bottom=min(NewImage(:));
NewImage=(NewImage-bottom)/(top-bottom);     %数据的映射处理，符合人眼视觉特性
NewImage=1.5.*(NewImage);
subplot(1,2,2),imshow((NewImage));%title('基于同态滤波的增强图像');