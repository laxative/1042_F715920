function [bit] = NumToSngBin(x)
    bit = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; %init
    %check is positive or is negative
    if(x>=0)
        bit(1) = 0;
    else
        x = -x;
        bit(1) = 1;
    end
    c = 127;
    while(x>2)
        x=x./2;
        c=c+1;
    end
    while(x<1)
        x=x.*2;
        c=c-1;
    end
    %now x=1.xxxxxxxxxx
    for i=2:1:9
        if(c>=(2.^(9-i)))
            bit(i)=1;
            c=c-2.^(9-i);
        else
            bit(i)=0;
        end
    end
    f=x-1;
    for i=10:1:32
        f=f*2;
        bit(i)=fix(f);
        if f>=1
            f=f-1;
        end
    end
end
