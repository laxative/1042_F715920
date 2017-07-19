%figure1
x=-7:0.01:7;
y=gx(x);
plot(x,y,'.');
axis([-7,7,-Inf,Inf]);
figure;
%figure2
%using backward method
h=[0.1 0.01 0.001 0.0001];
for i=1:4
    plot(x,diff_gx(x,h(i)),'-');
    if i<4
        hold on;
    end
end
legend('h=0.1','h=0.01','h=0.001','h=0.0001');
axis([-7,7,-Inf,Inf]);
figure;
%figure3
for i=1:4
    semilogy(x,diff_gx_error(x,h(i)),'-');
    if i<4
        hold on;
    end
end
axis([-7,7,-Inf,Inf]);
figure;
%figure4
%using central difference
for i=1:4
    plot(x,diff_gxc(x,h(i)),'-');
    if i<4
        hold on;
    end
end
axis([-7,7,-Inf,Inf]);
figure;
%figure5
for i=1:4
    semilogy(x,diff_gxc_error(x,h(i)),'-');
    if i<4
        hold on;
    end
end
axis([-7,7,-Inf,Inf]);
figure;
for i=1:50
    h(i) = 2.^(-i);
end
loglog(h,diff_fx_error(1,h),'-');
axis([0,1,-Inf,Inf]);
figure;
%figure7
loglog(h,diff_fxc_error(1,h),'-');
axis([0,1,-inf,inf]);

%-------------------------------------------------------------
load('quiz3.mat');
figure;
plot(T,Y,'.');
xlabel('t');
ylabel('y');
title('y-t');
figure;

for i=2:3000  %use central difference
    vY(i) = (Y(i+1)-Y(i-1))./2;
end
vY(1)=vY(2);
vY(3001)=vY(3000);
plot(T,vY,'.');
xlabel('t');
ylabel('v');
title('v-t');
figure;
for i=2:3000  %use central difference
    aY(i) = (vY(i+1)-vY(i-1))./2;
end
aY(1)=aY(2);
aY(3001)=aY(3000);
plot(T,aY,'.');
xlabel('t');
ylabel('a');
title('a-t');


%----- to find the top place
l=1;
h=3001;
mid = fix((l+h)./2);
for n=1:100
    if vY(mid)>=0
        l = mid;
    else
        h = mid;
    end
    mid = fix((l+h)./2);
end
fprintf(1,'At t=%.2f, the thing is at highest place %d\n',mid./100,Y(mid));