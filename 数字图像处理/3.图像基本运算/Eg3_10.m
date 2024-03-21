Back=im2double(imread('bird.jpg'));
Templet=im2double(imread('birdtemplet.bmp'));
result=immultiply(Templet,Back);
imwrite(result,'xiangcheng.jpg');
% imwrite(result2,'jianbeijing.jpg');
% imwrite(result3,'jianbiaoliangjiabeijing.jpg');
subplot(131),imshow(Back),title('±³¾°');
subplot(132),imshow(Templet),title('Ä£°å');
subplot(133),imshow(result),title('Í¼ÏñÏà³Ë');
