%五阶贝塞尔曲线
%为满足使连接点曲率连续和切线连续,增加了两对控制点

clc
clear
close all
p0=[0,0];
p1=[5,5];
p2=p1;

p3=[40,10];
p4=p3;
p5=[60,10];

t = 0:0.0001:1;

p11_x = (1-t)*p0(1) + t.*p1(1);
p12_x = (1-t)*p1(1) + t*p2(1);
p13_x = (1-t)*p2(1) + t*p3(1);
p14_x = (1-t)*p3(1) + t*p4(1);
p15_x = (1-t)*p4(1) + t*p5(1);

p21_x = (1-t).*p11_x + t.*p12_x;
p22_x = (1-t).*p12_x + t.*p13_x;
p23_x = (1-t).*p13_x + t.*p14_x;
p24_x = (1-t).*p14_x + t.*p15_x;

p31_x = (1-t).*p21_x + t.*p22_x;
p32_x = (1-t).*p22_x + t.*p23_x;
p33_x = (1-t).*p23_x + t.*p24_x;

p41_x = (1-t).*p31_x + t.*p32_x;
p42_x = (1-t).*p32_x + t.*p33_x;

p51_x = (1-t).*p41_x + t.*p42_x;

p11_y = (1-t)*p0(2) + t.*p1(2);
p12_y = (1-t)*p1(2) + t*p2(2);
p13_y = (1-t)*p2(2) + t*p3(2);
p14_y = (1-t)*p3(2) + t*p4(2);
p15_y = (1-t)*p4(2) + t*p5(2);
 
p21_y = (1-t).*p11_y + t.*p12_y;
p22_y = (1-t).*p12_y + t.*p13_y;
p23_y = (1-t).*p13_y + t.*p14_y;
p24_y = (1-t).*p14_y + t.*p15_y;
 
p31_y = (1-t).*p21_y + t.*p22_y;
p32_y = (1-t).*p22_y + t.*p23_y;
p33_y = (1-t).*p23_y + t.*p24_y;
 
p41_y = (1-t).*p31_y + t.*p32_y;
p42_y = (1-t).*p32_y + t.*p33_y;
 
p51_y = (1-t).*p41_y + t.*p42_y;

%subplot(2,2,1)
figure(1)
hold on
l_x = linspace(-10,0,10000);
l_y = l_x;
plot(l_x,l_y,'k-')
plot([p0(1),p1(1),p2(1)],[p0(2),p1(2),p2(2)],'--k*')
plot(p51_x,p51_y,'k')
plot([p3(1),p4(1),p5(1)],[p3(2),p4(2),p5(2)],'--k*')
plot([60,90],[10,10],'-k')
%title('直线-5阶-直线')
p51_x = [l_x p51_x];
p51_y = [l_y p51_y];
xlim([-15,95])

figure(2)
subplot(2,2,2)
dy = diff(p51_y)./diff(p51_x);
dy(end+1) = 0;
plot(p51_x,dy)
title('一阶')
xlim([-15,65])

subplot(2,2,3)
ddy = diff(dy)./diff(p51_x);
ddy(end+1) = 0;
plot(p51_x,ddy,'*','markersize',0.8)
title('二阶')
xlim([-15,65])

subplot(2,2,4)
k = ddy./(1+dy.^2).^(3/2)
plot(p51_x,k)
title('曲率')
xlim([-15,65])