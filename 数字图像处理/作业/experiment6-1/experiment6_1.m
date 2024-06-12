close all;clc;clear;
image=im2double(rgb2gray(imread('test.png')));

NoiseI=image+0.05*randn(size(image));
w=15;sigma_s=6;sigma_r=0.1;
[X,Y]=meshgrid(-w:w,-w:w);
Gs=exp(-(X.^2+Y.^2)/(2*sigma_s^2));
[hm,wn]=size(NoiseI);result=zeros(hm,wn);
for i=1:hm
    for j=1:wn
        temp=NoiseI(max(i-w,1):min(i+w,hm),max(j-w,1):min(j+w,wn));
        Gr=exp(-(temp-NoiseI(i,j)).^2/(2*sigma_r^2));
        W=Gr.*Gs((max(i-w,1):min(i+w,hm))-i+w+1,(max(j-w,1):min(j+w,wn))-j+w+1);
        result(i,j)=sum(W(:).*temp(:))/sum(W(:));
    end
end
subplot(1,3,1),imshow(image);
subplot(1,3,2),imshow(NoiseI);
subplot(1,3,3),imshow(result);
