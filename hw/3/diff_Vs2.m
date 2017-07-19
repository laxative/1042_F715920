function v = diff_Vs2(t,h)
    v = (Vs2(t+h)-Vs2(t-h))./(2.*h);
end