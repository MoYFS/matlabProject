clc;close all;
Ts=1;%基带信号码元周期
N=17;%采样点数
dt=Ts/N;
df=1.0/(20.0*Ts);
t=-10*Ts:dt:10*Ts;
f=-2/Ts:df:2*Ts;
a=[0,0.5,1];
for n=1:length(a)
    for k=1:length(f)
        if abs(f(k))>0.5*(1+a(n))/Ts
            Xf(n,k)=0;
        elseif abs(f(k))<0.5*(1-a(n))/Ts
            Xf(n,k)=Ts;
        else
            Xf(n,k)=0.5*Ts*(1+cos(pi*Ts/(a(n)+eps)*(abs(f(k))-0.5*(1-a(n))/Ts)));
        end
    end
    xt(n,:)=sinc(t/Ts).*(cos(a(n)*pi*t/Ts))./(1-4*a(n)^2*t.^2/Ts^2+eps);
end
subplot(2,1,1)
plot(f,Xf,'LineWidth', 2);
legend('a=0','a=0.5','1')
axis([-2 2 0 1.2]);
title('升余弦滚降频谱')
xlabel('f/Ts');
ylabel('幅度');
subplot(2,1,2)
plot(t,xt,'LineWidth', 2);
legend('a=0','a=0.5','1')
axis([-10 10 -0.5 1.1])
xlabel('t');
title('升余弦滚降波形')
ylabel('幅度');
