Image=imread('lotus.jpg');
deltax=20;deltay=20;
T=maketform('affine',[1 0 0;0 1 0;deltax deltay 1]);
NewImage1=imtransform(Image,T,'XData',[1 size(Image,2)],'YData',[1,size(Image,1)],'FillValue',255);
NewImage2=imtransform(Image,T,'XData',[1 size(Image,2)+deltax],'YData',[1,size(Image,1)+deltay],'FillValue',255);
subplot(131),imshow(Image),title('ԭͼ');
subplot(132),imshow(NewImage1),title('�����ߴ粻��ƽ��');
subplot(133),imshow(NewImage2),title('�����ߴ�����ƽ��');
