%q1_2.2-2
ans1 = 1./A(20,0.01);
ans2 = B(20,0.01);
fprintf(1,'e^-0.01 = %.8f\ne^-0.01 = %.8f\n',ans1,ans2);

%q1_2.2-3
for N=16:1:22
    ans1 = 1./A(N,20);
    ans2 = B(N,20);
    fprintf(1,'N=%d\n',N);
    fprintf(1,'e^20 = %.8f\ne^20 = %.8f\n',ans1,ans2);
end