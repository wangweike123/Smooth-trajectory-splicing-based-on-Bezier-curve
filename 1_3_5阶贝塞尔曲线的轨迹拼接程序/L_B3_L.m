%三阶贝塞尔曲线
%为满足使连接点曲率连续和切线连续,增加了两对控制点

clc
clear
close all
p0=[0,0];
p1=[10,10];

p2=[10,10];
p3=[60,10];

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

subplot(2,2,1)
hold on
l_x = linspace(-10,0,10000);
l_y = l_x;
plot(l_x,l_y,'k-')
plot([p0(1),p1(1)],[p0(2),p1(2)],'--k*')
plot(p31_x,p31_y,'k')
plot([p2(1),p3(1)],[p2(2),p3(2)],'--k*')
plot([60,70],[10,10],'-k')
%title('直线-3阶-直线')
p31_x = [l_x p31_x];
p31_y = [l_y p31_y];
xlim([-15,65])

subplot(2,2,2)
dy = diff(p31_y)./diff(p31_x);
dy(end+1) = 0;
plot(p31_x,dy)
title('一阶')
xlim([-15,65])

subplot(2,2,3)
ddy = diff(dy)./diff(p31_x);
ddy(end+1) = 0;
plot(p31_x,ddy,'*','markersize',0.8)
title('二阶')
xlim([-15,65])

subplot(2,2,4)
k = ddy./(1+dy.^2).^(3/2)
plot(p31_x,k,'*','markersize',0.8)
title('曲率')
xlim([-15,65])