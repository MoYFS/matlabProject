close all;clc;clear;
Image=rgb2gray(imread('test.png'));
sigma1=0.6; sigma2=10; r=3;  % 高斯模板的参数
NoiseI= imnoise(Image,'gaussian'); %加噪
gausFilter1=fspecial('gaussian',[2*r+1 2*r+1],sigma1);  
gausFilter2=fspecial('gaussian',[2*r+1 2*r+1],sigma2);  
result1=imfilter(NoiseI,gausFilter1,'conv');
result2=imfilter(NoiseI,gausFilter2,'conv');
subplot(2,3,1);imshow(Image);subplot(2,3,2);imshow(NoiseI);subplot(2,3,3);imshow(result1);subplot(2,3,4);imshow(result2);
[height,width]=size(NoiseI);                                       
for x=-r:r
    for y=-r:r
H(x+r+1,y+r+1)=1/(2*pi*sigma1^2).*exp((-x.^2-y.^2)/(2*sigma1^2));
    end
end 
H=H/sum(H(:));  %归一化高斯模板H  
result3=zeros(height,width);            %滤波后图像  
midimg=zeros(height+2*r,width+2*r);    %中间图像  
midimg(r+1:height+r,r+1:width+r)=NoiseI;  
for ai=r+1:height+r  
    for aj=r+1:width+r  
        temp_row=ai-r; temp_col=aj-r;  temp=0;  
        for bi=1:2*r+1 
            for bj=1:2*r+1 
                temp=temp+(midimg(temp_row+bi-1,temp_col+bj-1)*H(bi,bj));  
            end  
        end  
       result3(temp_row,temp_col)=temp;  
    end  
end  
subplot(2,3,5);imshow(uint8(result3));