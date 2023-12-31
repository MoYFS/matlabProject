%%function Hd = Experiment_one
%EXPERIMENT_ONE 返回离散时间滤波器对象。

% MATLAB Code
% Generated by MATLAB(R) 9.10 and DSP System Toolbox 9.12.
% Generated on: 28-Dec-2023 17:09:26

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 2000;  % Sampling Frequency

N      = 128;  % Order
Fstop1 = 100;  % First Stopband Frequency
Fpass1 = 110;  % First Passband Frequency
Fpass2 = 290;  % Second Passband Frequency
Fstop2 = 300;  % Second Stopband Frequency
Wstop1 = 30;   % First Stopband Weight
Wpass  = 1;    % Passband Weight
Wstop2 = 30;   % Second Stopband Weight
dens   = 20;   % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 ...
           0], [Wstop1 Wpass Wstop2], {dens});
Hd = dfilt.dffir(b);

% [EOF]
y1=rand(50,1)*50;
subplot(211)
plot(y1)
title('原来的信号')
%对随机信号进行滤波
y2=filter(Hd,y1);
subplot(212)
plot(y2)
title('滤波后的信号')