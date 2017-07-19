clear all;
clc;
G=6.67384e-11;
ms=2e+30;
mp=6e+24;
r0=1.5e+11;
%(a)
%ddx/dtt = -(Gm1m2/r0^2)*cos(), where cos() = x(t)/r0
%ddy/dtt = -(Gm1m2/r0^2)*sin(), where sin() = y(t)/r0

%(b)
h = 864;
a = G.*ms./(r0.*r0);
vc = sqrt(a.*r0);
fprintf(1,'vc = %.6f (m/s)\n',vc);

%(c)
%assume the planet is right from the sun
x(1) = r0;
y(1) = 0;
vx(1) = 0;
vy(1) = vc;
ax(1) = -a.*(x(1)./r0);
ay(1) = -a.*(y(1)./r0);
t(1) = 1;
T = 2.*pi.*r0./vc;
fprintf(1,'T=%.6f(year)\n',T./86400./365); %(year)
%using euler method
for i=1:T./h
    t(i+1) = (i+1);
    vx(i+1) = vx(i) + h.*ax(i);
    vy(i+1) = vy(i) + h.*ay(i);
    x(i+1) = x(i) + h.*vx(i);
    y(i+1) = y(i) + h.*vy(i);
    ax(i+1) = -a.*(x(i)./r0);
    ay(i+1) = -a.*(y(i)./r0);
end
subplot(2,2,2);
plot(t./36500,x);
axis([-inf inf -inf inf]);
subplot(2,2,4);
plot(t./36500,y);
axis([-inf inf -inf inf]);
subplot(2,2,[1 3]);
plot(x,y);
axis([-inf inf -inf inf]);
figure;

%(d)
x(1) = r0;
y(1) = 0;
vx(1) = 0;
vy(1) = 0.7.*vc;
ax(1) = -a.*(x(1)./r0);
ay(1) = -a.*(y(1)./r0);
t(1) = 1;
T = 2.*pi.*r0./(vc.*0.7);
fprintf(1,'T=%.6f(year)\n',T./86400./365); %year
%using euler method
for i=1:T./h
    t(i+1) = (i+1);
    vx(i+1) = vx(i) + h.*ax(i);
    vy(i+1) = vy(i) + h.*ay(i);
    x(i+1) = x(i) + h.*vx(i);
    y(i+1) = y(i) + h.*vy(i);
    ax(i+1) = -a.*(x(i)./r0);
    ay(i+1) = -a.*(y(i)./r0);
end
subplot(2,2,2);
plot(t./36500,x);
axis([-inf inf -inf inf]);
subplot(2,2,4);
plot(t./36500,y);
axis([-inf inf -inf inf]);
subplot(2,2,[1 3]);
plot(x,y);
axis([-inf inf -inf inf]);
figure;

%(e)
sum = 0;
for i=1:36501
    sum = sum + ((x(i)-0)./x(1)).^2 + ((y(i)-0)./y(36500./4)).^2;
    %use equation to check whether an oval or not
end
ans = sum./36501;
fprintf(1,'error = %.6f\n',abs(ans-1));
%because ans is almost equal to 1, so it is an oval

%(f)
year = 86400.*365;
AU = 149597871e+3;
num = (1-0.2)./1e-4;
for i=1:num
    k(i) = 0.2 + i.*(1e-4);
    T = (2.*pi.*r0./(vc.*k(i)))./year;   %year
    R = r0./AU; %AU
    ratio(i) = abs(R.^3-T.^2);
    hold on;
end
plot(k,ratio);
