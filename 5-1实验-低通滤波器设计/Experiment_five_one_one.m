%实验一
%%模拟滤波器 -巴特沃斯滤波器设计
clear all; close all;
wp=2*pi*2000; %设置通带频率
ws=2*pi*3500; %设置阻带频率
Rp=1; %设置通带波纹系数
As=20; %设置阻带波纹系数
[N,wc]=buttord(wp,ws,Rp,As,'s')
%计算巴特沃斯滤波器阶数和 3dB 截止频率输出参数 N 代表满足设计要求的滤波器的最小阶数
fprintf('巴特沃斯滤波器 N= %4d\n',N); %显示滤波器阶数
[B,A]=butter(N,wc,'s'); 
%求巴特沃斯滤波器系数，即求传输函数的分子和分母的系数向量
fk=0:800/512:8000; %设置模拟频率
wk=2*pi*fk; 
Hk=freqs(B,A,wk); %求巴特沃斯滤波器频率响应
figure
plot(fk/1000,20*log10(abs(Hk)));
grid on,xlabel('频率（kHz）'),ylabel('幅度（dB）')
title('巴特沃斯模拟滤波器')
axis([0,10,-35,5])

figure
x=[0:pi/200:200]
y1=sin(x);
subplot(211)
plot(y1)
title('原来的信号')
y2=filter(B,A,y1);
subplot(212)
plot(y2)
title('滤波后的信号')