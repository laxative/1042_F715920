%hw1_4
G = 6.67384e-11;
Ms = 1.98892e+30;
Me = 5.97219e+24;
%(a)
%l1 : (G.*Ms)./(RMsMe-RMsm).^2 - (G.*Me)./(RMsm).^2 =
%(G.*Ms.*(RMsMe-RMsm))./(RMsm).^2
%l2 : (G.*Ms)./(RMsMe+RMsm).^2 + (G.*Me)./(RMsm).^2 =
%(G.*Ms.*(RMsMe+RMsm))./(RMsm).^2
%l3 : (G.*Ms)./(RMsMe-RMsm).^2 + (G.*Me)./((2.*RMsMe-RMsm).^2 =
%((G.*Me)./(G.*(Ms+Me)).*RMsMe + RMsMe - RMsm).*((G.*(Ms+Me))./(RMsMe.^3))
%(b)
x1 = 1 - ((Me./(3.*Ms))).^(1./3);
x2 = 1 + ((Me./(3.*Ms))).^(1./3);
x3 = 1 + (7.*Me./(12.*Ms));
fprintf(1,'The distance ratio of L1: %.2f\n',x1);
fprintf(1,'The distance ratio of L2: %.2f\n',x2);
fprintf(1,'The distance ratio of L3: %.2f\n',x3);
