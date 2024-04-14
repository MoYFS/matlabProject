close all;clc;clear;
image=imread("test.png");
subplot(2,3,1);imshow(image);
image=imrotate(image,-20,"bilinear");
subplot(2,3,2);imshow(image)
image=fliplr(image);
subplot(2,3,3);imshow(image)
image=imtransform(image,maketform('affine',[1,0.5,0;0.3,1,0;0,0,1]),'bilinear');
subplot(2,3,4);imshow(image)
image=imresize(image,0.6,"bilinear");
subplot(2,3,5);imshow(image)