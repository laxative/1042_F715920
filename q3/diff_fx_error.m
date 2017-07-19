function error = diff_fx_error(x,h)
    error = abs(diff_fx(x,h) - cosh(x));
    %fprintf(1,'error=%.16f\n',error);
end