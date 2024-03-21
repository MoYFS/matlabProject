Image=im2double(imread('lotus.jpg'));
tform1=maketform('affine',[1 0 0;0.5 1 0; 0 0 1]);
tform2=maketform('affine',[1 0.5 0;0 1 0; 0 0 1]);
NewImage1=imtransform(Image,tform1);
NewImage2=imtransform(Image,tform2);
subplot(1,2,1),imshow(NewImage1);
subplot(1,2,2),imshow(NewImage2);
% imwrite(NewImage1,'shear1.jpg');
% imwrite(NewImage2,'shear2.jpg');
