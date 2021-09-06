%五阶贝塞尔曲线
%为满足使连接点曲率连续和切线连续,增加了两对控制点
clc
clear
close all

%
p0=[10,-10];
p1=[23,20];
p2=[30,30];
p3=[35,10];

%计算第一条Bezier曲线
t = 0:0.0001:1;
p11_x = (1-t)*p0(1) + t.*p1(1);
p12_x = (1-t)*p1(1) + t*p2(1);
p13_x = (1-t)*p2(1) + t*p3(1);

p21_x = (1-t).*p11_x + t.*p12_x;
p22_x = (1-t).*p12_x + t.*p13_x;
p31_x = (1-t).*p21_x + t.*p22_x;


p11_y = (1-t)*p0(2) + t.*p1(2);
p12_y = (1-t)*p1(2) + t*p2(2);
p13_y = (1-t)*p2(2) + t*p3(2);

p21_y = (1-t).*p11_y + t.*p12_y;
p22_y = (1-t).*p12_y + t.*p13_y;
p31_y = (1-t).*p21_y + t.*p22_y;


% p0=[-10,-10];
% p1=[0,0];
% p2=[5,20];
% 
% p3=[20,10];
% p4=[30,20];
% p5=[40,10];
%第二条B5曲线控制点
%第二条B5曲线控制点
p12=[120,50];
p13=[135,55];
p14=[140,45];
p15=[150,40];

%
p6=p3;
p7=3*(p3-p2)/5+p6;
p8=3*(p3-2*p2+p1)/10+2*p7-p6;
p11=p12;
p10=p11-3*(p13-p12)/5;
p9=3*[p14-2*p13+p12]/10-p11++2*p10;
%计算Bezier曲线
t = 0:0.0001:1;
p11_x_2 = (1-t)*p6(1) + t.*p7(1);
p12_x_2 = (1-t)*p7(1) + t*p8(1);
p13_x_2 = (1-t)*p8(1) + t*p9(1);
p14_x_2 = (1-t)*p9(1) + t*p10(1);
p15_x_2 = (1-t)*p10(1) + t*p11(1);

p21_x_2 = (1-t).*p11_x_2 + t.*p12_x_2;
p22_x_2 = (1-t).*p12_x_2 + t.*p13_x_2;
p23_x_2 = (1-t).*p13_x_2 + t.*p14_x_2;
p24_x_2 = (1-t).*p14_x_2 + t.*p15_x_2;

p31_x_2 = (1-t).*p21_x_2 + t.*p22_x_2;
p32_x_2 = (1-t).*p22_x_2 + t.*p23_x_2;
p33_x_2 = (1-t).*p23_x_2 + t.*p24_x_2;

p41_x_2 = (1-t).*p31_x_2 + t.*p32_x_2;
p42_x_2 = (1-t).*p32_x_2 + t.*p33_x_2;

p51_x_2 = (1-t).*p41_x_2 + t.*p42_x_2;

p11_y_2 = (1-t)*p6(2) + t.*p7(2);
p12_y_2 = (1-t)*p7(2) + t*p8(2);
p13_y_2 = (1-t)*p8(2) + t*p9(2);
p14_y_2 = (1-t)*p9(2) + t*p10(2);
p15_y_2 = (1-t)*p10(2) + t*p11(2);
 
p21_y_2 = (1-t).*p11_y_2 + t.*p12_y_2;
p22_y_2 = (1-t).*p12_y_2 + t.*p13_y_2;
p23_y_2 = (1-t).*p13_y_2 + t.*p14_y_2;
p24_y_2 = (1-t).*p14_y_2 + t.*p15_y_2;
 
p31_y_2 = (1-t).*p21_y_2 + t.*p22_y_2;
p32_y_2 = (1-t).*p22_y_2 + t.*p23_y_2;
p33_y_2 = (1-t).*p23_y_2 + t.*p24_y_2;
 
p41_y_2 = (1-t).*p31_y_2 + t.*p32_y_2;
p42_y_2 = (1-t).*p32_y_2 + t.*p33_y_2;
 
p51_y_2 = (1-t).*p41_y_2 + t.*p42_y_2;


%第二条B5曲线控制点
% p12=[120,50];
% p13=[140,55];
% p14=[150,65 ];

%计算Bezier曲线
t = 0:0.0001:1;
p11_x_3 = (1-t)*p12(1) + t.*p13(1);
p12_x_3 = (1-t)*p13(1) + t*p14(1);
p13_x_3 = (1-t)*p14(1) + t*p15(1);
p21_x_3 = (1-t).*p11_x_3 + t.*p12_x_3;
p22_x_3 = (1-t).*p12_x_3 + t.*p13_x_3;
p31_x_3 = (1-t).*p21_x_3 + t.*p22_x_3;

p11_y_3 = (1-t)*p12(2) + t*p13(2);
p12_y_3 = (1-t)*p13(2) + t*p14(2);
p13_y_3 = (1-t)*p14(2) + t*p15(2);
p21_y_3 = (1-t).*p11_y_3 + t.*p12_y_3;
p22_y_3 = (1-t).*p12_y_3 + t.*p13_y_3;
p31_y_3 = (1-t).*p21_y_3 + t.*p22_y_3;

figure(3)
subplot(2,2,1)
hold on
%画第一个B5前三个控制点
p_x = [p31_x p51_x_2 p31_x_3];
p_y = [p31_y p51_y_2 p31_y_3];
plot([p12(1),p13(1),p14(1),p15(1)],[p12(2),p13(2),p14(2),p15(2)],'--k*')
plot([p6(1),p7(1),p8(1)],[p6(2),p7(2),p8(2)],'--k*')
plot([p9(1),p10(1),p11(1)],[p9(2),p10(2),p11(2)],'--k*')
plot([p0(1),p1(1),p2(1),p3(1)],[p0(2),p1(2),p2(2),p3(2)],'--k*')
%画第一个B5
plot(p_x,p_y,'k')
%画第一个B5后三个控制点
%title('3阶-5阶-3阶')
xlim([-25,160])

subplot(2,2,2)
dy = diff(p_y)./diff(p_x);
%dy(end+1) = 1;
p_x = p_x(1:end-1);
plot(p_x,dy)
title('一阶')
xlim([-25,160])

subplot(2,2,3)
ddy = diff(dy)./diff(p_x);
%ddy(end+1) = 0;
p_x = p_x(1:end-1);
plot(p_x,ddy,'*','markersize',0.8)
title('二阶')
xlim([-25,160])

subplot(2,2,4)
k = ddy./(1+dy(1:end-1).^2).^(3/2)
plot(p_x,k,'*','markersize',0.8)
title('曲率')
xlim([-25,160])
