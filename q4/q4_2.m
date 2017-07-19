for i=1:6
    h(i) = 10^(-(i+1));
end
for i=1:6
    num = (2-0)./h(i);
    ans = 0;
    high = 0+h(i);
    low = 0;
    for j=1:num
        mid = (func2(high) + func2(low)).*h(i)./2;
        ans = ans + mid;
        low = low + h(i);
        high = high + h(i);
    end
    fprintf(1,'h=%d, ans = %.8f\n',h(i),ans);
end