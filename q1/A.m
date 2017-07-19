function sum = A(N,x)
    sum = 1;
    T = 1;
    for k=1:1:N
        for i=1:1:k
            T = T.*i;
        end
        sum = sum + ((x.^k)./T);
    end
end