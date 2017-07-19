%(a)
%vinput(t)=vc(t)+RC(vc(t))'

clear all;
clc;
%(b)
R=10e+3;
C=100e-6;
%vc(t)'=(vinput(t)-vc(t))./(RC)
dt=1e-4;
num=10./dt;
vc0=0;
for i=1:num
    t(i)=i.*dt;
    vc(i)=vc0+dt.*((vinput(i.*dt)-vc0)./(R.*C));
    vc0=vc(i);
end
plot(t,vc);
xlabel('time(s)');
ylabel('V(v)');
figure;
%(c)
vc0=0;
for i=1:num
    vc(i)=vc0+dt.*((vinput2(i.*dt)-vc0)./(R.*C));
    vc0=vc(i);
end
plot(t,vc);
xlabel('time(s)');
ylabel('V(v)');
axis([0 0.04 -inf inf]);
figure;
%(d)
R=100;
C=1e-6;
vc=0;
vr(1)=0;
for i=1:num
    vc=vc+dt.*((vinput3(i.*dt)-vc)./(R.*C));
    vr(i+1)=vinput3((i+1).*dt)-vc;
end
vr(num+1)=[];
plot(t,vr);
xlabel('time(s)');
ylabel('V(v)');
axis([0 0.04 -inf inf]);