
Back=imread('desert.jpg');
Foreground=imread('car.jpg');
result1=imadd(Foreground,-100);
result2=imadd(Back,Foreground);
result3=imadd(Back,result1);
imwrite(result1,'jiabiaoliang.jpg');
imwrite(result2,'jiabeijing.jpg');
imwrite(result3,'jiabiaoliangjiabeijing.jpg');
subplot(221),imshow(Foreground),title('ԭĿ��ͼ');
subplot(222),imshow(result1),title('ԭĿ��ͼ�ӱ���');
subplot(223),imshow(result2),title('ԭĿ��ͼ�ӱ���');
subplot(224),imshow(result3),title('�ӱ���ͼ���ӱ���');
