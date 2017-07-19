for i=1:6
    h(i) = 10^(-(i+1));
end
correct = sin(pi.*(1./2))-sin(pi.*(1./4));
for i=1:6
    num = (0.5-0.25)./h(i);
    ans = 0;
    high = 0.25+h(i);
    low = 0.25;
    for j=1:num
        mid = (func1(high) + func1(low)).*h(i)./2;
        ans = ans + mid;
        low = low + h(i);
        high = high + h(i);
    end
    draw(i) = abs(ans-correct);
    fprintf(1,'h=%d, ans = %.8f, error = %.8f\n',h(i),ans,draw(i));
end
loglog(h,draw);
