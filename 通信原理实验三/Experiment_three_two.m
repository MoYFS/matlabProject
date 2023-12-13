clc;close all;
alpha=0.4;                        %设置滚降系数，取值范围在[0,1]
Ts=1e-2;              %升余弦滚降滤波器的参考码元周期, Ts=10ms,无ISI。
Fs=1e3;          %采样频率，单位Hz。注意：该数值过大将严重增加程序运行时间
Rs=50;                           %输入码元速率，单位BaudM=2;
Num=100;   %输入码元序列长度。注意：该数值过大将严重增加程序运行时间。
Samp_rate=Fs/Rs;  %采样率，应为大于1的正整数，即要求Fs,Rs之间呈整数倍关系               
M=2;
code=randi([0,1],1,Num);%生成Num位信息序列
t = 0:0.5:(length(code)*10-1)*0.5;
length_t = length(t);
NRZ=[];%生成双极性不归零方波
for i = 1:length(code)
    if code(i) == 1
        %使用方括号拼接两个向量[]
        NRZ = [NRZ ones(1, 10)];%为了和t长度一样，一次的跨度也要为10
    else
        NRZ = [NRZ -ones(1, 10)];
    end
end
%对双极性NRZ码元序列进行抽样
k=1;
for ii=1:Num
    for jj=1:Samp_rate
        Samp_data(k)=NRZ(ii*10);
        k=k+1;
    end
end
%基带升余弦滚降系统冲激响应
[ht,a] = rcosine(1/Ts,Fs,'fir',alpha);
%将信号送入基带升余弦滚降系统，即做卷积操作
st=conv(Samp_data,ht)/(Fs*Ts);

subplot(2,1,1)
plot(t,NRZ,'LineWidth', 2);
set(gca,'xtick',0:5:100);axis([0,100,-1,1]);
title('双极性不归零码');xlabel('t');ylabel("幅度");


subplot(2,1,2)
plot(st);axis([0 450 -2 2]);set(gca,'xtick',0:12.5:450);
xlabel('时间');ylabel('信号幅度');title('经过升弦滚降系统后的码元')

eyediagram(st, Samp_rate*4, 2000,Samp_rate)
title('基带信号眼图');xlabel('时间');ylabel('信号幅度');