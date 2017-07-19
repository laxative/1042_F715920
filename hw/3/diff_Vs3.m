function v = diff_Vs3(t,h)
    v = (Vs3(t+h)-Vs3(t-h))./(2.*h);
end