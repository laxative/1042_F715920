function y = at(t,h)
    y = (vt(t+h)-vt(t-h))./(2.*h);
end