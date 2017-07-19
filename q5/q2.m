clear all;
clc;
%q2
h=1e-6;
num=(4-0)./h;
y0=1.5;
v0=20;
g=-9.8;
for i=1:num
    t(i) = i;
    v(i) = v0 + h.*g;
    v0 = v(i);
    y(i) = y0 + h.*v(i);
    y0 = y(i);
end
plot(t.*h,y);
xlabel('t(s)');
ylabel('y(m)');
figure;
plot(t.*h,v);
xlabel('t(s)');
ylabel('v(m/s)');

fprintf(1,'y''(4)=%.8f (m/s)\n',v(4./h));
fprintf(1,'y(4)=%.8f (m)\n',y(4./h));