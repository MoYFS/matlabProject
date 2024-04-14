close all;clc;clear;
image=imread("test.png");
imageLaplace=imfilter(image,fspecial("laplacian"));
image1=image.*imageLaplace;
image=[image,imageLaplace,image.*imageLaplace,image-image.*imageLaplace+imageLaplace*10];
imshow(image);