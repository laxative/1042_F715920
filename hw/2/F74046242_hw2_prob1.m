%q1, v-t
t=0:0.01:20;
y=vt(t);
plot(t,y);
xlabel('t(s)');
ylabel('V(m/s)');
figure;
%q2, F-t
h=10e-8;
a=at(t,h);
m=5;     %m=5(kg)
F=m.*a;  %F=ma
plot(t,F);
xlabel('t(s)');
ylabel('F(N)');
%q3
accur = 10e-6;
a8 = at(8,accur); %find a(8);
f8 = m.*a8; %F(8) = m.*a(8);
fprintf(1,'F(8) = %.6f N\n',f8);
%trapezoid method
%q4
x=0;
accur=10e-5;
num=10./accur;
low=0;
high=0+accur;
for i=1:num
    mid=(vt(high)+vt(low)).*accur./2;
    x=x+mid;
    low=low+accur;
    high=high+accur;
end
fprintf(1,'x(10) = %.8f m\n',x);
%q5
absx=0;
low=0;
high=0+accur;
for i=1:num
    mid=abs((vt(high)+vt(low)).*accur./2);
    absx=absx+mid;
    low=low+accur;
    high=high+accur;
end
fprintf(1,'The total travel length from t = 0 to 10 is %.8f m\n',absx);