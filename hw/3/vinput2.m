function v = vinput2(t)
    if rem(t,20e-3) <= 10e-3
        v=5;
    else
        v=-5;
    end
end