clear all;
clc;
%q1-1
C = 20e-6;
R = 47e+3;
%-CR.*(diff(Vc(t)))=Vc(t)
%Vc(t)./-RC = diff(Vc(t))
%use euler method
%step size=1e-5
h = 1e-5;
num = 10./h; %t from 0 to 10
Vc = 1;
for i=1:num
    t(i) = i.*h;
    v(i) = Vc + h.*(Vc./(-(R.*C)));
    Vc = v(i);
end
plot(t,v);
hold on;
%step size=1e-6
h2 = 1e-6;
num = 10./h2; %t from 0 to 10
Vc = 1;
for i=1:num
    t2(i) = i.*h2;
    v2(i) = Vc + h2.*(Vc./(-(R.*C)));
    Vc = v2(i);
end
plot(t2,v2);
xlabel('t(s)');
ylabel('Vc(V)');
legend('h=1e-5','h=1e-6');
%q1-2
%step size=1e-5
fprintf(1,'Vc(0.3) = %.8f(V), step size=%.2e\n',v((30000)),h);  %10s=>1e+5 t, 0.3s=>3e+4
%step size=1e-6
fprintf(1,'Vc(0.3) = %.8f(V), step size=%.2e\n',v2((300000)),h2);  %10s=>1e+6 t, 0.3s=>3e+5
%1-3
%step size=1e-5
T=1;
while abs(v(T+1)-0.1) < abs(0.1-v(T))
    T = T + 1;
end
fprintf(1,'It take %.6f(s) for the capacitor’s voltage to drop to 0.1 V (step size=%.2e)\n',T.*h,h);
%step size=1e-6
T=1;
while abs(v2(T+1)-0.1) < abs(0.1-v2(T))
    T = T + 1;
end
fprintf(1,'It take %.6f(s) for the capacitor’s voltage to drop to 0.1 V (step size=%.2e)\n',T.*h2,h2);
