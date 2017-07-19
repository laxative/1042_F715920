clear all;
inside = 0;
num = 1000000;
for i=1:num
    x = rand.*8-4;
    y = rand.*4-2;
    if (x^2)/16 + (y^2)/4 <= 1
        inside = inside + 1;
    end
end
ans = 32.*(inside./num);
fprintf(1,'ans=%.8f\n',ans);