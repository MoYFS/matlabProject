Image2=imread('lotus.jpg');
HImage=flipdim(Image2,2);
VImage=flipdim(Image2,1);
CImage=flipdim(HImage,1);
subplot(221),imshow(Image2);
subplot(222),imshow(HImage);
subplot(223),imshow(VImage);
subplot(224),imshow(CImage);
