function v = vinput3(t)
    if rem(t,40e-3) <= 10e-3
        v = (5./10e-3).*rem(t,40e-3);
    elseif rem(t,40e-3) <= 20e-3
        v = 5-(5./10e-3).*rem((t-10e-3),40e-3);
    elseif rem(t,40e-3) <= 30e-3
        v = -((5./10e-3).*rem((t-20e-3),40e-3));
    else 
        v = -5+(5./10e-3).*rem((t-30e-3),40e-3);
    end
end