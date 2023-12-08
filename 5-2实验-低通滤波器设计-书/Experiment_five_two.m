clear;
close all;
wp=2*pi*4*10^3;ws=2*pi*5*10^3;ap=1;as=15;
Fs=30*10^3;
wp1=wp/Fs;ws1=ws/Fs;
omp1=2*Fs*tan(wp1/2);oms1=2*Fs*tan(ws1/2);
[N,WC]=buttord(omp1,oms1,ap,as,'s');
[b,a]=butter(N,WC,'s');
[bz,az]=bilinear(b,a,Fs);
w0=[wp1,ws1];
Hx=freqz(bz,az,w0);
[H,W]=freqz(bz,az);
dbHx=-20*log10(abs(Hx)/max(abs(H)));
plot(W,abs(H));
xlabel('相对频率');
ylabel('幅频');
grid;