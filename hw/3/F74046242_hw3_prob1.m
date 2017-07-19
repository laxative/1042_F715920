clear all;
clc;

k=58e+3;
m=1.2e+3;
c=4e+3;  %dumping constant
%q1

%mx''+cx'+kx=0
%=>x''+(c./m)x'+(k./m)x=0
%=>x''=-(k./m)x-(c./m)x'
%=>x'=-(k./c)x-(m./c)x''

%q2
%using euler method
h=1e-5;
num=3./h;
x0=-0.1;
v0=0;
for i=1:num
    t(i)=i.*h;
    a0=-(k./m).*x0-(c./m).*v0;
    v0=-(k./c).*x0-(m./c).*a0;
    v(i)=v0+h.*a0;
    v0=v(i);
    x(i)=x0+h.*v(i);
    x0=x(i);
end
plot(t,x);
xlabel('time(s)');
ylabel('(m)');
%q3
%to find T
%and f=1./T
%find two x=0, the time between them is the T
t1=1; %from t=0 to t=0.5
while abs(x(t1)-0) >= h
    t1 = t1 + 1;
end
t2=50000; %from t=0.5 to t=1
while abs(x(t2)-0) >= h
    t2 = t2 + 1;
end
%t2-t1 is half of T
f=1./((t2-t1).*2.*h);
fprintf(1,'the oscillation frequency of the system is f=%.6f\n',f);