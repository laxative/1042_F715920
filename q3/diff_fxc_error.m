function error = diff_fxc_error(x,h)
    error = abs(diff_fxc(x,h) - cosh(x));
    %fprintf(1,'error=%.16f\n',error);
end