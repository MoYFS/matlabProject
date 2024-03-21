Back=imread('hallback.bmp');
Foreground=imread('hallforeground.bmp');
result=imabsdiff(Foreground,Back);
imwrite(result,'xiangjian.jpg');
subplot(131),imshow(Back),title('±³¾°');
subplot(132),imshow(Foreground),title('Ç°¾°Í¼');
subplot(133),imshow(result),title('Í¼ÏñÏà¼õ');

