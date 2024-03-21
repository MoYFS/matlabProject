%f=[1 4 7;2 5 8;3 6 9]; 
f=[59 60 58;61 59 57;62 56 55];
[h w]=size(f);
ang=30;
% ang=pi/6;
% cornerx=[0 w-1 0 w-1];
% cornery=[0 0 h-1 h-1];
% newcornerx=cornerx*cos(ang)+cornery*sin(ang);
% newcornery=-cornerx*sin(ang)+cornery*cos(ang);
% minx=min(newcornerx);
% miny=min(newcornery);
% H=ceil(max(newcornery)-miny+1);
% W=ceil(max(newcornerx)-minx+1);
New1=imrotate(f,ang)
New2=imrotate(f,ang,'bilinear')
% for newx=1:W
%     for newy=1:H
%         oldx=(newx-1+minx);
%         oldy=newy-1+miny;        
%     end
% end
% for newx=1:W
%     for newy=1:H
%         oldx=(newx-1+minx)*cos(ang)-(newy-1+miny)*sin(ang);
%         oldy=(newx-1+minx)*sin(ang)+(newy-1+miny)*cos(ang);        
%     end
% end
