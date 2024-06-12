close all;clc;clear;
image=(rgb2gray(imread('test1.png')));
subplot(2,2,1),imshow(image);%title('原始图像');
result1=blkproc(image,[45 32],@histeq);
subplot(2,2,2),imshow(result1);%title('无重叠的局部直方图均衡化图像');
[height,width]=size(image);
result2=zeros(height,width);
n=16;%邻域模板半径
hh=height+2*n;  ww=width+2*n;
ff=zeros(hh,ww);%图像对外边缘扩充ff
ff(n+1:hh-n,n+1:ww-n)=image;
ff(1:n,n+1:ww-n)=image(1:n,:);
ff(hh-n+1:hh,n+1:ww-n)=image(height-n+1:height,:);
ff(:,1:n)=ff(:,n+1:n*2);
ff(:,ww-n+1:ww)=ff(:,ww+1-n*2:ww-n);
ff=uint8(ff);
for i=n+1:hh-n
    for j=n+1:ww-n  
        lwc=histeq(ff(i-n:i+n,j-n:j+n),256);
        result2(i-n,j-n)=lwc(n+1,n+1);%实现对子块中心像素点的均衡化处理
    end
end
subplot(2,2,3),imshow(uint8(result2));%title('重叠的局部直方图均衡化图像');
sumf=int16(zeros(hh,ww));%%转化成int16型数据
num=zeros(hh,ww);
for i=n+1:8:hh-n
    for j=n+1:8:ww-n 
        lwc=int16(histeq(ff(i-n:i+n,j-n:j+n),256));%计算子块的局部直方图均衡化
        sumf(i-n:i+n,j-n:j+n)=sumf(i-n:i+n,j-n:j+n)+lwc;%像素的均衡化结果进行累加
        num(i-n:i+n,j-n:j+n)=num(i-n:i+n,j-n:j+n)+1;%像素被均衡化的累加次数
    end
end
result3(:,:)=double(sumf(n+1:hh-n,n+1:ww-n));
result3(:,:)=result3(:,:)./num(n+1:hh-n,n+1:ww-n);%像素的均衡化结果取平均值
rr(:,:)=uint8(result3(:,:));
subplot(2,2,4),imshow(uint8(result3(:,:)));%title('部分重叠的局部直方图均衡化图像');