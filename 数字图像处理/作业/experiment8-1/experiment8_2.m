clear,clc,close all;
Image=rgb2gray(imread('test.png'));
subplot(1,2,1),imshow(Image);
hist=imhist(Image);bottom=min(Image(:))+1;top=max(Image(:))+1;
J=zeros(256,1);
for t=bottom+1:top-1
    po=sum(hist(bottom:t));pb=sum(hist(t+1:top));
    ho=0;hb=0;
    for j=bottom:t
        ho=ho-log(hist(j)/po+0.01)*hist(j)/po;
    end
    for j=t+1:top
        hb=hb-log(hist(j)/pb+0.01)*hist(j)/pb;
    end
    J(t)=ho+hb;        
end
[maxJ,pos]=max(J(:));result=zeros(size(Image));result(Image>pos)=1;
subplot(1,2,2),imshow(result);