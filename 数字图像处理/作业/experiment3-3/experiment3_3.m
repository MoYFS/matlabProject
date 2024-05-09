close all;clc;clear;
image=imread('test1.png');
subplot(1,3,1),imshow(image);
imageNear=imresize(image,1.5,'nearest');
subplot(1,3,2),imshow(imageNear);
imageBili=imresize(image,1.5,'bilinear');
subplot(1,3,3),imshow(imageBili);