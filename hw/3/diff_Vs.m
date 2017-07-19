function v=diff_Vs(t,h)
    v=(Vs(t+h)-Vs(t-h))./(2.*h);
end