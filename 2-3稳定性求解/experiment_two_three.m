close all;
clc;
A=[1,-0.9];B=[0.05,0.05];%系统差分方程系数向量B和A
h=impz(B,A,25);
figure;
stem(h);%调用函数stem绘图
title('（a）系统单位响应h(n)');

un=ones(1,256);%产生信号u(n)
n=0:255;
f1=sin(0.014*n);%产生正弦信号
f2=sin(0.4*n);%产生正弦信号
xsin=f1+f2;%合成信号
A=[1,-1.8237,0.9801];
B=[1/100.49,0,-1/100.49];%系统差分方程系数向量B和A
figure;
subplot(4,1,1);stem(un);title('un');
subplot(4,1,2);stem(f1);title('f1');
subplot(4,1,3);stem(f2);title('f2');
subplot(4,1,4);stem(xsin);title('xsin');
figure;
y1n=filter(B,A,un);%谐振器对u(n)的响应y1(n)
y2n=filter(B,A,xsin);%谐振器对xsin(n)的响应y2(n)
subplot(2,1,1);stem(y1n);title('(h)谐振器对u(n)的响应y1(n)');
subplot(2,1,2);stem(y2n);title('(i)谐振器对xsin(n)的响应y2(n)');