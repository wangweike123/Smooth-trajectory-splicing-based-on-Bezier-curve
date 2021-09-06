clc
clear
close all

% 使用了圆弧的参数方程
%% 圆弧1--首
t1 = -pi/3:0.001:-pi/4;
x1 = 10*cos(t1);
y1 = 10*sin(t1);

dx1 = diff(x1)./diff(t1);
dy1 = diff(y1)./diff(t1);

figure(1)
hold on
subplot(2,2,1)
plot(x1,y1)
title('x-y')
subplot(2,2,2)
plot(t1(1:end-1),dy1./dx1)
title('dy/dx')

ddx1 = diff(dx1)./diff(t1(1:end-1));
ddy1 = diff(dy1)./diff(t1(1:end-1));
dy1_dx1 = dy1./dx1;
ddy1_ddx1 = (ddy1.*dx1(2:end)-dy1(2:end).*ddx1)./(dx1(2:end).^3);
R1 = ddy1_ddx1./((1+dy1_dx1(2:end).^2).^(3/2))
%ddx1 = x1(2:end-1);
subplot(2,2,3)
plot(t1(2:end-1),ddy1_ddx1,'*','markersize',0.8)
title('ddy/ddx')
subplot(2,2,4)
plot(t1(2:end-1),R1,'*','markersize',0.8)
title('R')
%axis([ 0.5 1.8 -1 1 ])


%% 圆弧2--尾
t3 = (-pi/3:0.001:-pi/5);
x3 = 10*cos(t3)+6;
y3 = 10*sin(t3)+2;

dx3 = diff(x3)./diff(t3);
dy3 = diff(y3)./diff(t3);

figure(2)
hold on
subplot(2,2,1)
plot(x3,y3)
title('x3-y3')
subplot(2,2,2)
plot(t3(1:end-1),dy3./dx3)
title('dy3/dx3')

ddx3 = diff(dx3)./diff(t3(1:end-1));
ddy3 = diff(dy3)./diff(t3(1:end-1));
dy3_dx3 = dy3./dx3;
ddy3_ddx3 = (ddy3.*dx3(1:end-1)-dy3(1:end-1).*ddx3)./(dx3(1:end-1).^3);
R3 = ddy3_ddx3./((1+dy3_dx3(2:end).^2).^(3/2))
%ddx1 = x1(2:end-1);
subplot(2,2,3)
plot(t3(2:end-1),ddy3_ddx3,'*','markersize',0.8)
title('ddy3/ddx3')
subplot(2,2,4)
plot(t3(2:end-1),R3,'*','markersize',0.8)
title('R3')
%axis([ 1.5 2.5 -1 1 ])


%% bezier曲线
% p0=[x1(end),y1(end)];
% p1=[p0(1)+2,p0(2)+dy1(end)*(2)];
% p2=[p1(1)+2,p1(2)+2*( 2*ddy1(end) + dy1(end) )];
dt_x = 1;
p0=[x1(end),y1(end)];
%p1=[dy1_dx1(end)/5]+p0;
%p1=[p0(1)+1 p0(2)+dy1_dx1(end)*1]
p1=[ p0(1)+dt_x p0(2)+dt_x*dy1_dx1(end) ];
%p2=ddy1_ddx1(end)/20+2*p1-p0;
%p2=[1+2*p1(1)-p0(1) ddy1_ddx1(end)*1+2*p1(2)-p0(2)]
p2=[ dt_x/20+2*p1(1)-p0(1) ddy1_ddx1(end)*(1*[p1(1)-p0(1)])^2+dy1_dx1*dt_x+2*p1(2)-p0(2)  ]

p5=[x3(1),y3(1)];
%p4=p5-dy3_dx3(1)/5;
p4=[p5(1)-1 p5(2)-dy3_dx3(1)*1]
%p3=ddy3_ddx3(1)/20-p5+2*p4;
p3=[1-p5(1)+2*p4(1) ddy3_ddx3(1)*1+2*p4(2)-p5(2)]
% p4=[p5(1)-dx3(1)*0.001,p5(2)-dy3(1)*0.001];
% p3 = [p4(1)-0.001*(dx3(1)-0.001*ddx3(1)),p4(2)-0.001*(dy3(1)-0.001*ddy3(1))];

%计算Bezier曲线
t2 = 0:0.01:1;
p11_x = (1-t2)*p0(1) + t2.*p1(1);
p12_x = (1-t2)*p1(1) + t2*p2(1);
p13_x = (1-t2)*p2(1) + t2*p3(1);
p14_x = (1-t2)*p3(1) + t2*p4(1);
p15_x = (1-t2)*p4(1) + t2*p5(1);

p21_x = (1-t2).*p11_x + t2.*p12_x;
p22_x = (1-t2).*p12_x + t2.*p13_x;
p23_x = (1-t2).*p13_x + t2.*p14_x;
p24_x = (1-t2).*p14_x + t2.*p15_x;

p31_x = (1-t2).*p21_x + t2.*p22_x;
p32_x = (1-t2).*p22_x + t2.*p23_x;
p33_x = (1-t2).*p23_x + t2.*p24_x;

p41_x = (1-t2).*p31_x + t2.*p32_x;
p42_x = (1-t2).*p32_x + t2.*p33_x;

p51_x = (1-t2).*p41_x + t2.*p42_x;

p11_y = (1-t2)*p0(2) + t2.*p1(2);
p12_y = (1-t2)*p1(2) + t2*p2(2);
p13_y = (1-t2)*p2(2) + t2*p3(2);
p14_y = (1-t2)*p3(2) + t2*p4(2);
p15_y = (1-t2)*p4(2) + t2*p5(2);
 
p21_y = (1-t2).*p11_y + t2.*p12_y;
p22_y = (1-t2).*p12_y + t2.*p13_y;
p23_y = (1-t2).*p13_y + t2.*p14_y;
p24_y = (1-t2).*p14_y + t2.*p15_y;
 
p31_y = (1-t2).*p21_y + t2.*p22_y;
p32_y = (1-t2).*p22_y + t2.*p23_y;
p33_y = (1-t2).*p23_y + t2.*p24_y;
 
p41_y = (1-t2).*p31_y + t2.*p32_y;
p42_y = (1-t2).*p32_y + t2.*p33_y;
 
p51_y = (1-t2).*p41_y + t2.*p42_y;

figure(3)

subplot(2,2,1)
hold on
%画第一个B5前三个控制点
plot([p0(1),p1(1),p2(1)],[p0(2),p1(2),p2(2)],'--*')
%画第一个B5后三个控制点
plot([p3(1),p4(1),p5(1)],[p3(2),p4(2),p5(2)],'--*')
x2 = p51_x;
y2 = p51_y;
dx2 = diff(x2)./diff(t2);
dy2 = diff(y2)./diff(t2);

plot(x2,y2)
title('x2-y2')

subplot(2,2,2)
plot(t2(1:end-1),dy2./dx2)
title('dy2/dx2')

ddx2 = diff(dx2)./diff(t2(1:end-1));
ddy2 = diff(dy2)./diff(t2(1:end-1));
dy2_dx2 = dy2./dx2;
ddy2_ddx2 = (ddy2.*dx2(1:end-1)-dy2(1:end-1).*ddx2)./(dx2(1:end-1).^3);
R2 = ddy2_ddx2./((1+dy2_dx2(2:end).^2).^(3/2))
%ddx1 = x1(2:end-1);
subplot(2,2,3)
plot(t2(2:end-1),ddy2_ddx2,'*','markersize',0.8)
title('ddy2/ddx2')
subplot(2,2,4)
plot(t2(2:end-1),R2,'*','markersize',0.8)
title('R2')
%axis([ 1.5 2.5 -1 1 ])

figure(4)
hold on
plot([x1,x2,x3],[y1,y2,y3],'k')
%画第一个B5前三个控制点
plot([p0(1),p1(1),p2(1)],[p0(2),p1(2),p2(2)],'--k*')
%画第一个B5后三个控制点
plot([p3(1),p4(1),p5(1)],[p3(2),p4(2),p5(2)],'--k*')