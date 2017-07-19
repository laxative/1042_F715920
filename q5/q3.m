clear all;
clc;
%q3-1
k=1;
x0=-0.5;
m=1;
%x''(t)=-(k./m)*x(t)
a0=-(k./m).*x0;
v0=0;
h=1e-6;
num=10./h;
for i=1:num
    t(i) = i;
    v(i) = v0 + h.*a0;
    v0 = v(i);
    x(i) = x0 + h.*v(i);
    x0 = x(i);
    a0=-(k./m).*x(i);
end
plot(t.*h,v);
hold on;
plot(t.*h,x);
xlabel('t(s)');
legend('v-t','x-t');
%q3-2
ans=2000; %remember not to start find from t=0.000002(s), it may have problem
while abs(x(ans)-x(1)) >= h
    ans = ans + 1;
end
fprintf(1,'period = %.6f(s)\n',(ans-1).*h);