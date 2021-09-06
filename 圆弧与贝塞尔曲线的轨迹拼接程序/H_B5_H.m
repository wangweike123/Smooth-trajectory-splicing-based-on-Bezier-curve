clc
clear
close all

%% 圆弧1--首
t1 = pi+pi/4:0.001:pi+pi/3;
x1 = 10*cos(t1);
y1 = 10*sin(t1);

dy1 = diff(y1)./diff(x1);
dx1 = x1(2:end)
%figure(1)
%plot(t1(1:end-1),dy1)
%title('一阶')

ddy1 = diff(dy1)./diff(dx1);
%ddx1 = x1(2:end-1);
%figure(2)
%plot(t1(2:end-1),ddy1,'*','markersize',0.8)
%title('二阶')

%% 圆弧2--尾
t2 = (pi+pi/4:0.001:pi+pi/3)+31.5;
x3 = 15*cos(t2)+10;
y3 = 15*sin(t2)+3;
dy3 = diff(y3)./diff(x3);
dx3 = x3(2:end);
%figure(3)
%plot(t2(1:end-1),dy3)
%title('一阶')

ddy3 = diff(dy3)./diff(dx3);
ddx3 = x3(2:end-1);
%figure(4)
%plot(t2(2:end-1),ddy3,'*','markersize',0.8)
%title('二阶')

%% bezier曲线
p0=[x1(end),y1(end)];
p1=[p0(1)+2,p0(2)+dy1(end)*(2)];
p2=[p1(1)+2,p1(2)+2*( 2*ddy1(end) + dy1(end) )];

p5=[x3(1),y3(1)];
p4=[x3(1)-2,p5(2)-dy3(1)*2];
%p3=[p4(1)-2,2*p4(2)-p5(2)+4*ddy3(1)+0.6];
p3 = [p4(1)-2,p4(2)-2*(dy3(1)-2*ddy3(1))];

%计算Bezier曲线
t = 0:0.001:1;
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

figure(5)
subplot(2,2,1)
hold on
%画第一个B5前三个控制点
plot([p0(1),p1(1),p2(1)],[p0(2),p1(2),p2(2)],'--*')
%画第一个B5后三个控制点
plot([p3(1),p4(1),p5(1)],[p3(2),p4(2),p5(2)],'--*')
title('x - y')
xlabel('x')
ylabel('y')
plot(x1(1),y1(1),'bo')
plot(x3(end),y3(end),'ro')
p_x = [x1 p51_x x3];
p_y = [y1 p51_y y3];
%tp = [1:size(p_x,2)]
plot(p_x,p_y)
%xlim([-15,155])

s = [0];
for i = 1:size(p_x,2)-1
    s(end+1) = s(end)+sqrt((p_x(i+1)-p_x(i))^2+(p_y(i+1)-p_y(i))^2);
end
s = s(2:end);

subplot(2,2,2)
dy = diff(p_y)./diff(p_x);
%dy(end+1) = 1;
p_x = p_x(1:end-1);
plot(s(1:end),dy,'*','markersize',0.8)
xlabel('路程')
title('一阶')
%xlim([-15,155])

subplot(2,2,3)
ddy = diff(dy)./diff(p_x);
%ddy(end+1) = 0;
p_x = p_x(1:end-1);
plot(s(2:end),ddy,'*','markersize',0.8)
xlabel('路程')
title('二阶')
%xlim([-15,155])

subplot(2,2,4)
k = ddy./(1+dy(1:end-1).^2).^(3/2);
plot(s(2:end),k,'*','markersize',0.8)
xlabel('路程')
title('曲率')
%xlim([-15,155])

