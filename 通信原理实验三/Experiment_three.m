% clc;
% close all;
% % 定义二进制信码
% code = [1 0 0 1 1 0 0 0 0 1 0 1];
% % 创建时间轴数据
% t = 0:0.5:(length(code)*10-1)*0.5;
%  
% length_t = length(t);
% %查看t的长度
% disp(length_t);
% % 单极性非归零码
% NRZ = [];%存储单极性非归零码
% for i = 1:length(code)
%     if code(i) == 1
%         %使用方括号拼接两个向量[]
%         NRZ = [NRZ ones(1, 10)];%为了和t长度一样，一次的跨度也要为10
%     else
%         NRZ = [NRZ zeros(1, 10)];
%     end
% end
% 
% RZ = [];
% for i = 1:length(code)
%     if code(i) == 1
%         RZ = [RZ ones(1, 5) zeros(1, 5)];%从高电平到低电平过渡
%     else
%         RZ = [RZ zeros(1, 10)];
%     end
% end
% 
% figure
% subplot(2,1,1)
% plot(t,NRZ,'LineWidth', 2);
% set(gca,'xtick',0:5:60)
% axis([0,60,-1,1])
% title('100110000101单极性不归零码')
% xlabel('t')
% ylabel("幅度")
% subplot(2,1,2)
% plot(t,RZ,'LineWidth', 2);
% set(gca,'xtick',0:5:60)
% title('100110000101单极性归零码')
% axis([0,60,-1,1])
% xlabel('t')
% ylabel("幅度")

% clc;
% close all;
% % 定义二进制信码
% code = [0 1 0 1 1 0 1 0 ];
% % 创建时间轴数据
% t = 0:0.5:(length(code)*9-1)*0.5;
%  
% length_t = length(t);
% %查看t的长度
% disp(length_t);
% % 单极性归零码
% URZ= [];%存储单极性归零码
% for i = 1:length(code)
%     if code(i) == 1
%         %使用方括号拼接两个向量[]
%         URZ = [URZ ones(1,6) zeros(1, 3)];%为了和t长度一样，一次的跨度也要为10
%     else
%         URZ = [URZ zeros(1, 9)];
%     end
% end
% 
% BRZ = [];
% for i = 1:length(code)
%     if code(i) == 1
%         BRZ = [BRZ ones(1,6) zeros(1, 3)];%从高电平到低电平过渡
%     else
%         BRZ = [BRZ -ones(1, 6) zeros(1, 3)];
%     end
% end
% 
% figure
% subplot(2,1,1)
% plot(URZ,'LineWidth', 2);
% set(gca,'xtick',0:3:72)
% axis([0,72,-1,1])
% title('01011010单极性归零码')
% xlabel('t')
% ylabel("幅度")
% subplot(2,1,2)
% plot(BRZ,'LineWidth', 2);
% set(gca,'xtick',0:3:72)
% title('01011010双极性归零码')
% axis([0,72,-1,1])
% xlabel('t')
% ylabel("幅度")

clc;
close all;
% 定义二进制信码
code = [1 0 0 1 0 1 0 1 1 0 ];
% 创建时间轴数据
t = 0:0.5:(length(code)*5-1)*0.5;
 
length_t = length(t);
%查看t的长度
disp(length_t);
% 单极性归零码
MDC= [];%存储单极性归零码
temp=[-ones(1, 5)];
for i = 1:length(code)
    if code(i) == 1
        %使用方括号拼接两个向量[]
        MDC = [MDC -temp];%为了和t长度一样，一次的跨度也要为5
    else
        MDC = [MDC temp];
    end
end

SDC = [];
temp=[-ones(1, 5)];
for i = 1:length(code)
    if code(i) == 0
        SDC = [SDC -temp];%从高电平到低电平过渡
    else
        SDC = [SDC temp];
    end
end

figure
subplot(2,1,1)
plot(MDC,'LineWidth', 2);
set(gca,'xtick',0:5:50)
axis([0,50,-1,1])
title('1001010110传号差分码')
xlabel('t')
ylabel("幅度")
subplot(2,1,2)
plot(SDC,'LineWidth', 2);
set(gca,'xtick',0:5:50)
title('1001010110空号差分码')
axis([0,50,-1,1])
xlabel('t')
ylabel("幅度")