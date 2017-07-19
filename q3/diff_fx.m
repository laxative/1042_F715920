function y = diff_fx(x,h)
    y = (fx(x+h)-fx(x))./h;
end