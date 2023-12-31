% close all;
% clc;
% num=[1,-0.2,-0.3,-0.3,-0.2];%H(z)分子系数
% den=[1,0.1,0.2,0.2,0.5];%H(z)的分母系数
% [z,p,K]=tf2zp(num,den);%H(z)的零点、极点、增益系数
% disp('零点');disp(z);
% disp('极点');disp(p);
% disp('增益系数');disp(K);
% figure;
% zplane(z,p);


%a求系统函数H(z)画出零、极点示意图
%对y(n)=0.9y(n-1)+x(n)两端进行z变换
close all;
clc;
b=[1,0];a=[1,-0.9];
figure;
zplane(b,a);%画出零、极点分布图
%^b画出系统的频幅特性和相频特性
[H,W]=freqz(b,a,200,'whole');
magH=abs(H(1:101));phaH=angle(H(1:101));
hw=W(1:101);
figure;
subplot(2,1,1);plot(hw/pi,magH);
xlabel('频率单位：pi');ylabel('幅度');
title('幅频响应');
subplot(2,1,2);plot(hw/pi,phaH);
xlabel('频率单位：pi');ylabel('相位单位');
title('相频响应');
%c求脉冲响应h(n)并画出系列图
[h,T]=impz(b,a,50);
figure;
stem(T,h);
xlabel('n');ylabel('h(n)');
title('脉冲响应');

