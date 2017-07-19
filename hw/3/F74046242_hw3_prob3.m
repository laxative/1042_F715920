%(a)
%the proof written in the pdf file
%(b)
clear all;
clc;
L=2e-3;
R=8;
C=5e-6;
%(vs(t))'=L(I(t))''+R(I(t))'+I(t)./C
%=>i''=(1/L)vs'-(R/L)i'-(1/LC)i

h=1e-6;
num=1./h;
I0=0;
dI0=0;
for i=1:num
    t(i)=i.*h;
    vs(i)=Vs(t(i));
    ddI(i)=(1./L).*diff_Vs(t(i),h)-(R./L).*dI0-(1./(L.*C)).*I0;
    dI(i) = dI0+h.*ddI(i);
    dI0 = dI(i);
    I(i) = I0 + h.*dI(i);
    I0 = I(i);
    vr(i)=I(i).*R;
end
plot(t,vr);
hold on;
plot(t,vs);
axis([0 0.01 -1 1]);
figure;
%(c)
I0=0;
dI0=0;
for i=1:num
    t(i)=i.*h;
    vs(i)=Vs2(t(i));
    ddI(i)=(1./L).*diff_Vs2(t(i),h)-(R./L).*dI0-(1./L./C).*I0;
    dI(i) = dI0+h.*ddI(i);
    dI0 = dI(i);
    I(i) = I0 + h.*dI(i);
    I0 = I(i);
    vr(i)=I(i).*R;
end
plot(t,vr);
hold on;
plot(t,vs);
axis([0 0.01 -1.5 1.5]);
figure;
%(d)
I0=0;
dI0=0;
for i=1:num
    t(i)=i.*h;
    vs(i)=Vs3(t(i));
    ddI(i)=(1./L).*diff_Vs3(t(i),h)-(R./L).*dI0-(1./L./C).*I0;
    dI(i) = dI0+h.*ddI(i);
    dI0 = dI(i);
    I(i) = I0 + h.*dI(i);
    I0 = I(i);
    vr(i)=I(i).*R;
end
plot(t,vr);
hold on;
plot(t,vs);
axis([0 0.01 -1 1]);