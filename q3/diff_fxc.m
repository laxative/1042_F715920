function y = diff_fxc(x,h)
    y = (fx(x+h)-fx(x-h))./(2.*h);
end