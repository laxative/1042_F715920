%q2_1
x = [-2:0.01:4];  %x-line
t = 0;  t1 = [-20:0.01:20];  %y-line
y = function1(x);
plot(x,y);
hold on;
plot(x,t,'.');
hold on;
plot(t,t1,'.');

%use bisection method
accur = 0.0001;
bot = -1;
top = 0;
while(top-bot > accur)
    mid = (top + bot)./2;
    if(function1(top).*function1(mid) < 0)
        bot = mid;
    else
        top = mid;
    end
end
ans = top