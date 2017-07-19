%all use trapezoid method
%q1
h=10e-6;
num=(4-0)./h;
ans = 0;
low = 0;
high = 0 + h;
for i=1:num
    mid = (prob2_func1(high) + prob2_func1(low)).*h./2;
    ans = ans + mid;
    low = low + h;
    high = high + h;
end
fprintf(1,'(i) %.8f + %.8f i\n',real(ans),imag(ans));
%q2
num=(pi-0)./h;
ans = 0;
low = 0;
high = 0 + h;
for i=1:num
    mid = (prob2_func2(high) + prob2_func2(low)).*h./2;
    ans = ans + mid;
    low = low + h;
    high = high + h;
end
fprintf(1,'(ii) %.8f\n',ans);
%q3
num=(1-0)./h;
ans = 0;
low = 0;
high = 0 + h;
for i=1:num
    mid = (prob2_func3(high) + prob2_func3(low)).*h./2;
    ans = ans + mid;
    low = low + h;
    high = high + h;
end
fprintf(1,'(iii) %.8f\n',ans);