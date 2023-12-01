function xt=xtg
close all
clc;
%信号x(t)产生,并显示信号的幅频特性曲线
%xt=xtg(N) 产生一个长度为N,有加性高频噪声的单频调幅信号xt,采样频率Fs=1000Hz
%载波频率fc=Fs/10=100Hz,调制正弦波频率f0=fc/10=10Hz.
N=1000;Fs=1000;T=1/Fs;Tp=N*T;
t=0:T:(N-1)*T;
fc=Fs/10;f0=fc/10; %载波频率fc=Fs/10，单频调制信号频率为f0=Fc/10;
mt=cos(2*pi*f0*t); %产生单频正弦波调制信号mt，频率为f0
ct=cos(2*pi*fc*t); %产生载波正弦波信号ct，频率为fc
xt=mt.*ct; %相乘产生单频调制信号xt %0.5(cos(f1+f2)+cos(f1-f2)) sinsin中间是 -
nt=2*rand(1,N)-1; %产生随机噪声nt
figure
subplot(511),plot(mt)
subplot(512),plot(mt)
subplot(513),plot(mt)
subplot(514),plot(mt)
subplot(515),plot(mt)
%%%可以把上面的mt改成相应的其他信号
%--------------------信号波形------------------------
figure
xt=xt; %调制信号
fst=fft(xt,N);k=0:N-1;f=k/Tp;
subplot(2,1,1);plot(t,xt);grid;xlabel('t/s');ylabel('x(t)');
axis([0,Tp/5,min(xt),max(xt)]);title('(a) 信号波形')
subplot(2,1,2);plot(f,abs(fst)/max(abs(fst)));grid;title('(b) 信号的频谱')
axis([0,Fs/2,0,1.2]);xlabel('f/Hz');ylabel('幅度')
%--------------------信号加噪声波形------------------------
figure
xt=xt+nt; %调制信号加噪声
fst=fft(xt,N);k=0:N-1;f=k/Tp;
subplot(2,1,1);plot(t,xt);grid;xlabel('t/s');ylabel('x(t)');
axis([0,Tp/5,min(xt),max(xt)]);title('(a) 信号加噪声波形')
subplot(2,1,2);plot(f,abs(fst)/max(abs(fst)));grid;title('(b) 信号加噪声的频谱')
axis([0,Fs/2,0,1.2]);xlabel('f/Hz');ylabel('幅度')