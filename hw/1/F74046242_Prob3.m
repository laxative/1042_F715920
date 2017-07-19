%hw1_3
%solve (a)
%to see where roots are

%x = [-5:0.01:5];
%y = function1(x);
%plot(x,y);
%axis([-5,5,-10,10]);

%smallest positive root a => 0 < a < 2
%largest negative root b => -3 < b < 0
%use bisection method
accur = 10e-9;
negbot = -3;
negtop = 0;
while(negtop-negbot > accur)
    mid = (negtop + negbot)./2;
    if(function1(negtop).*function1(mid) < 0)
        negbot = mid;
    else
        negtop = mid;
    end
end
negans = negtop;

posbot = 0;
postop = 2;
while(postop-posbot > accur)
    mid = (postop + posbot)./2;
    if(function1(postop).*function1(mid) < 0)
        posbot = mid;
    else
        postop = mid;
    end
end
posans = postop;
fprintf(1,'The smallest positive root of Prob.3(a) is %.8f\n',posans);
fprintf(1,'The largest negative root of Prob.3(a) is %.8f\n',negans);

%solve for (b)
%to see where roots are

%x = [2:0.001:5];
%y = function2(x);
%plot(x,y);

%smallest positive root a => 0 < a < 2
%largest negative root b => -5 < b < -1
%use bisection method

negbot = -5;
negtop = 0;
while(negtop-negbot > accur)
    mid = (negtop + negbot)./2;
    if(function2(negtop).*function2(mid) < 0)
        negbot = mid;
    else
        negtop = mid;
    end
end
negans = negtop;

posbot = 0;
postop = 2;
while(postop-posbot > accur)
    mid = (postop + posbot)./2;
    if(function2(postop).*function2(mid) < 0)
        posbot = mid;
    else
        postop = mid;
    end
end
posans = postop;
fprintf(1,'The smallest positive root of Prob.3(b) is %.8f\n',posans);
fprintf(1,'The largest negative root of Prob.3(b) is %.8f\n',negans);

%solve for (c)
%to see where roots are

%x = [-0.6:0.001:1];
%y = function3(x);
%plot(x,y);

%smallest positive root a => 0 < a < 1
%largest negative root b => -1 < b < 0
%use bisection method
negbot = -1;
negtop = 0;
while(negtop-negbot > accur)
    mid = (negtop + negbot)./2;
    if(function3(negtop).*function3(mid) < 0)
        negbot = mid;
    else
        negtop = mid;
    end
end
negans = negtop;

posbot = 0;
postop = 1;
while(postop-posbot > accur)
    mid = (postop + posbot)./2;
    if(function3(postop).*function3(mid) < 0)
        posbot = mid;
    else
        postop = mid;
    end
end
posans = postop;

fprintf(1,'The smallest positive root of Prob.3(c) is %.8f\n',posans);
fprintf(1,'The largest negative root of Prob.3(c) is %.8f\n',negans);
