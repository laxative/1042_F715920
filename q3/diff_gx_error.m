function error = diff_gx_error(x,h)
    error = abs(diff_gx(x,h) - pi.*cos(pi.*x));
end