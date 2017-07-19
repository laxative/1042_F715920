function num = SngBinToNum(bit)
    %num = s.*2.^(c-127).*(1+f)
    %find the number is positive or negative
    if bit(1)==0
        s = 1;
    else
        s = -1;
    end
    c = 0;
    for i=2:1:9
        c = c + bit(i).*(2.^(9-i));
    end
    f = 0;
    for i=10:1:32
        f = f + bit(i).*((1./2).^(i-9));
    end
    num = s.*(2.^(c-127)).*(1+f);
end
