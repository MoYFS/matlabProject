clc; close all;
wp=2*pi*3000; %设置通带频率
ws=2*pi*4500; %设置阻带频率
ap=1; %设置通带波纹系数
as=15; %设置阻带波纹系数
Fs=30*10^3; %采用频率
wp1=wp/Fs; ws1=ws/Fs;
[N,Wc]=buttord(wp,ws, ap,as,'s');
%计算巴特沃斯滤波器阶数和 3dB 截止频率输出参数 N 代表满足设计要求的滤波器的最小阶数
fprintf('巴特沃斯滤波器 N= %4d\n',N); %显示滤波器阶数
[b,a]=butter(N,Wc,'s'); 
%求巴特沃斯滤波器系数，即求传输函数的分子和分母的系数向量
[bz,az]=impinvar(b,a,Fs);
fk=0:800/512:8000; %设置模拟频率
wk=2*pi*fk; 
Hk=freqs(b,a,wk); %求巴特沃斯滤波器频率响应
figure
subplot(2,2,1)
plot(fk,20*log10(abs(Hk)));
grid on,xlabel('频率（kHz）'),ylabel('幅度（dB）')
title('巴特沃斯模拟滤波器')
axis([0,8000,-35,5])

w0=[wp1,ws1];
Hx=freqz(bz,az,w0);
[H,W]=freqz(bz,az);
dbHx=-20*log10(abs(Hx)/max(abs(H))); %求 wp1,ws1 对应的衰减
subplot(2,2,2)
plot(-dbHx);
subplot(2,2,3)
plot(W, abs(H));
xlabel('相对频率'),ylabel('幅度')
title('巴特沃斯数字滤波器')