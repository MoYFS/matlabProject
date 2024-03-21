close all;
clc;
clear;
Image=im2double(imread('lotus.jpg'));                %读取图像并转换为double型
[h,w,c]=size(Image);                              %获取图像尺寸
NewImage=ones(h,w,c);                           %新图像初始化
deltax=20;deltay=20;
for x=1:w                                       
    for y=1:h                                   %循环扫描新图像中点
        oldx=x-deltax;
        oldy=y-deltay;                              %确定新图像中点在原图中的对应点
        if oldx>0 && oldx<w && oldy>0 && oldy<h  %判断对应点是否在图像内
            NewImage(y,x,:)=Image(oldy,oldx,:);     %赋值
        end
    end
end
subplot(1,2,1)
imshow(NewImage);
NewImage1=ones(h,w,c);  
NewImage1(deltax+1:h,deltay+1:w,:)=Image(1:h-deltax,1:w-deltay,:);
subplot(1,2,2)
imshow(NewImage1);
NewImage2=imabsdiff(NewImage,NewImage1);
figure
imshow(NewImage2)

