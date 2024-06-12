function outputimage = change(image)
logI=log(image+1);  %对数运算
sigma=1.414;  filtersize=[7 7];  %高斯滤波器参数
lowfilter=fspecial('gaussian',filtersize,sigma);  %构造高斯低通滤波器
highfilter=zeros(filtersize);
highpara=1; lowpara=0.55;    %控制滤波器幅度范围的系数  
highfilter(ceil(filtersize(1,1)/2),ceil(filtersize(1,2)/2))=1;
highfilter=highpara*highfilter-(highpara-lowpara)*lowfilter; %高斯低通滤波器转换为高斯高通滤波器
highpart=imfilter(logI,highfilter,'replicate','conv'); %时域卷积实现滤波
outputimage=exp(highpart); %指数变换恢复图像
top=max(outputimage(:)); bottom=min(outputimage(:));
outputimage=(outputimage-bottom)/(top-bottom);     %数据的映射处理，符合人眼视觉特性
outputimage=1.5.*(outputimage);
end

