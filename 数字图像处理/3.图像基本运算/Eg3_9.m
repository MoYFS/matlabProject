Back=imread('hallback.bmp');
Foreground=imread('hallforeground.bmp');
result=imabsdiff(Foreground,Back);
imwrite(result,'xiangjian.jpg');
subplot(131),imshow(Back),title('����');
subplot(132),imshow(Foreground),title('ǰ��ͼ');
subplot(133),imshow(result),title('ͼ�����');

