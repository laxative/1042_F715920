%q2_2
x = [-6:0.01:8];  %x-line
t = 0;  t1 = [-15:0.01:15];  %y-line
y = function2(x);
plot(x,y);
hold on;
plot(x,t,'.');
hold on;
plot(t,t1,'.');

%use newton's method
accur = 0.001;
x1 = -2;
x2 = 0;
while(1)
    if(abs((x2-x1)./x1) <= accur)
        break;
    end
    x2 = x1;
    x1 = x1 - (function2(x1)./diff_func2(x1));
end
