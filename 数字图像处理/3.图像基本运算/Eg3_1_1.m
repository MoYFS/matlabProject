close all;
clc;
clear;
Image=im2double(imread('lotus.jpg'));                %��ȡͼ��ת��Ϊdouble��
[h,w,c]=size(Image);                              %��ȡͼ��ߴ�
NewImage=ones(h,w,c);                           %��ͼ���ʼ��
deltax=20;deltay=20;
for x=1:w                                       
    for y=1:h                                   %ѭ��ɨ����ͼ���е�
        oldx=x-deltax;
        oldy=y-deltay;                              %ȷ����ͼ���е���ԭͼ�еĶ�Ӧ��
        if oldx>0 && oldx<w && oldy>0 && oldy<h  %�ж϶�Ӧ���Ƿ���ͼ����
            NewImage(y,x,:)=Image(oldy,oldx,:);     %��ֵ
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

