function y = diff_gxc(x,h)
    y = (gx(x+h)-gx(x-h))./(2.*h);
end