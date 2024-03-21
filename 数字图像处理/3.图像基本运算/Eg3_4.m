Image=im2double(imread('lotus.jpg'));
NewImage1=imrotate(Image,15);
NewImage2=imrotate(Image,15,'bilinear');
subplot(1,2,1),imshow(NewImage1);
subplot(1,2,2),imshow(NewImage2);
imwrite(NewImage1,'rotate11.jpg');
imwrite(NewImage2,'rotate12.jpg');
