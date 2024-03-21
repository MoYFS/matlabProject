clear,clc,close all;
Image=imread('butterfly.bmp');
Back=imread('IMG3_13.jpg');
subplot(131),imshow(Image),title('ºûµû');
subplot(132),imshow(Back),title('±³¾°');
[h w c]=size(Back);
population=20;
num=3;
for k=1:population
    type=randi(6,1,num);
    NewImage=Image;
    for n=1:num
        switch type(n)
            case 1     %scale
                scale=rand();
                NewImage=imresize(NewImage,scale,'bilinear');            
            case 2    %rotate
                angle=round(rand()*100);
                NewImage=imrotate(NewImage,angle,'bilinear');
            case 3   %shear
                shear=rand()/2;
                tform1=maketform('affine',[1 0 0;shear 1 0; 0 0 1]);
                tform2=maketform('affine',[1 shear 0;0 1 0; 0 0 1]);
                NewImage=imtransform(NewImage,tform1);
                NewImage=imtransform(NewImage,tform2);               
            case 4   %mirroring H
                NewImage=flipdim(NewImage,2);
            case 5   %mirroring  V
                NewImage=flipdim(NewImage,1);
            case 6   %mirroring C
                NewImage=flipdim(NewImage,2);
                NewImage=flipdim(NewImage,1);
        end          
    end
    [newh neww newc]=size(NewImage);
    positionx=randi(w-2*neww,1,1);
    positiony=randi(h-2*newh,1,1);
    temp=Back(positiony:positiony+newh-1,positionx:positionx+neww-1,:);
    colorchange=randi(3,1,2);
    if colorchange(1)~=colorchange(2)
        color=NewImage(:,:,colorchange(1));
        NewImage(:,:,colorchange(1))=NewImage(:,:,colorchange(2));
        NewImage(:,:,colorchange(2))=color;
    end
    c=NewImage(:,:,1)&NewImage(:,:,2)&NewImage(:,:,3);
    pos=find(c(:)==0);
    NewImage(pos)=temp(pos);
    NewImage(pos+newh*neww)=temp(pos+newh*neww);
    NewImage(pos+2*newh*neww)=temp(pos+2*newh*neww);
    temp=NewImage;    
    Back(positiony:positiony+newh-1,positionx:positionx+neww-1,:)=temp;    
end
subplot(133),imshow(Back),title('ºÏ³ÉÍ¼');
imwrite(Back,'hecheng.jpg');
                
       