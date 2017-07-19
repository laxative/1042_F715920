%ax^2 + bx + c = 0
function [root1,root2,root3,root4] = solve(a,b,c)
    h = 1;
    if(or(abs(a)>10.^150,or(abs(b)>10.^150,abs(c)>10.^150)))
      h = 10.^150;
    end
    root1 = ((-1).*b + h.*sqrt((b./h).^2 - 4.*(a./h).*(c./h)))./(2.*a);
    root2 = ((-1).*b - h.*sqrt((b./h).^2 - 4.*(a./h).*(c./h)))./(2.*a);
    root3 = (-2.*c)./(b+h.*sqrt((b./h).^2-4.*(a./h).*(c./h)));
    root4 = (2.*c)./(-b+h.*sqrt((b./h).^2-4.*(a./h).*(c./h)));
    fprintf(1,'solve for %ex.^2 + %ex + %e = 0\n\n',a,b,c);
    fprintf(1,'root1=%.16e \nroot2=%.16e \nRationalized root1=%.16e \nRationalized root2=%.16e \n\n',root1,root2,root3,root4);
end