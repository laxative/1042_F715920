function error = diff_gxc_error(x,h)
    error = abs(diff_gxc(x,h) - pi.*cos(pi.*x));
end