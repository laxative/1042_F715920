function y = diff_gx(x,h)
    y = (gx(x)-gx(x-h))./h;
end