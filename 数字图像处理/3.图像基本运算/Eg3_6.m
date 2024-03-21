Image=im2double(imread('lotus.jpg'));
NewImage1=imresize(Image,1.5,'nearest');
NewImage2=imresize(Image,1.5,'bilinear');
subplot(1,2,1),imshow(NewImage1);
subplot(1,2,2),imshow(NewImage2);
imwrite(NewImage1,'scale1.jpg');
imwrite(NewImage2,'scale2.jpg');