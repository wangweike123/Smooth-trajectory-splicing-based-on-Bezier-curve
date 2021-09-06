clc
clear
close all

% 使用了圆弧的参数方程
%% 圆弧1--首
t1 = -pi/2:0.001:-pi/4;
x1 = 10*cos(t1);
y1 = 10*sin(t1);

dx1 = diff(x1)./diff(t1);
dy1 = diff(y1)./diff(t1);

ddx1 = diff(dx1)./diff(t1(2:end));
ddy1 = diff(dy1)./diff(t1(2:end));

dy1_dx1 = dy1./dx1;
ddy1_ddx1 = (ddy1.*dx1(2:end)-dy1(2:end).*ddx1)./(dx1(2:end).^3);
R1 = ddy1_ddx1./((1+dy1_dx1(2:end).^2).^(3/2))


%% 圆弧2--尾
% t3 = (-pi/3:0.001:-pi/5);
% x3 = 10*cos(t3)+15;
% y3 = 10*sin(t3)+2;
% 
% dx3 = diff(x3)./diff(t3);
% dy3 = diff(y3)./diff(t3);
% 
% ddx3 = diff(dx3)./diff(t3(1:end-1));
% ddy3 = diff(dy3)./diff(t3(1:end-1));
% 
% dy3_dx3 = dy3./dx3;
% ddy3_ddx3 = (ddy3.*dx3(1:end-1)-dy3(1:end-1).*ddx3)./(dx3(1:end-1).^3);
% R3 = ddy3_ddx3./((1+dy3_dx3(2:end).^2).^(3/2))


%% bezier曲线
dt_x = 1;
p0=[x1(end),y1(end)];
p1=[ dx1(end) dy1(end) ]/3 + p0;
p2=[ ddx1(end) ddy1(end) ]/6 + 2*p1 -p0
p3=p2+2;

%计算Bezier曲线
t2 = 0:0.01:1;
p11_x = (1-t2)*p0(1) + t2.*p1(1);
p12_x = (1-t2)*p1(1) + t2*p2(1);
p13_x = (1-t2)*p2(1) + t2*p3(1);
p21_x = (1-t2).*p11_x + t2.*p12_x;
p22_x = (1-t2).*p12_x + t2.*p13_x;
p31_x = (1-t2).*p21_x + t2.*p22_x;

p11_y = (1-t2)*p0(2) + t2.*p1(2);
p12_y = (1-t2)*p1(2) + t2*p2(2);
p13_y = (1-t2)*p2(2) + t2*p3(2);
p21_y = (1-t2).*p11_y + t2.*p12_y;
p22_y = (1-t2).*p12_y + t2.*p13_y;
p31_y = (1-t2).*p21_y + t2.*p22_y;

figure(3)

subplot(2,2,1)
hold on
%画第一个B5前三个控制点
plot([p0(1),p1(1),p2(1),p3(1)],[p0(2),p1(2),p2(2),p3(2)],'--*')
%画第一个B5后三个控制点
x2 = [x1 p31_x];
y2 = [y1 p31_y];

t = [ t1+t2(1)-t1(end) t2]

dx2 = diff(x2)./diff(t);
dy2 = diff(y2)./diff(t);

plot(x2,y2)
title('x2-y2')

subplot(2,2,2)
plot(t(1:end-1),dy2./dx2)
title('dy2/dx2')

ddx2 = diff(dx2)./diff(t(1:end-1));
ddy2 = diff(dy2)./diff(t(1:end-1));
dy2_dx2 = dy2./dx2;
ddy2_ddx2 = (ddy2.*dx2(1:end-1)-dy2(1:end-1).*ddx2)./(dx2(1:end-1).^3);
R2 = ddy2_ddx2./((1+dy2_dx2(2:end).^2).^(3/2))

subplot(2,2,3)
plot(t(2:end-1),ddy2_ddx2,'*','markersize',0.8)
title('ddy2/ddx2')
subplot(2,2,4)
plot(t(2:end-1),R2,'*','markersize',0.8)
title('R2')


figure(4)
hold on
plot([x1,p31_x],[y1,p31_y],'k')
%画三个控制点
plot([p0(1),p1(1),p2(1),p3(1)],[p0(2),p1(2),p2(2),p3(2)],'--k*')
