function Ie = prob4_func(x,y,z,edge,accur)
    %E=kq./r^2
    Ie = 0;
    k=8.987551e+9;
    q=1;
    dA = accur.^2;
    %Z=edge./2
    for X=-(edge./2):accur:(edge./2)
        for Y=-(edge./2):accur:(edge./2)
            leng = (X-x).^2 + (Y-y).^2 + ((edge./2)-z).^2;
            %in order to find cos()
            %first find two vector and one dot another
            dotvec = (X-x).*0+(Y-y).*0+((edge./2)-z).*edge;
            %second find the length of two vector and can find cos()
            Cos = dotvec./sqrt(leng)./edge;
            dE = k.*q./leng;
            Ie = Ie + dE.*dA.*Cos;
        end
    end
    %Z=-edge./2
    for X=-(edge./2):accur:(edge./2)
        for Y=-(edge./2):accur:(edge./2)
            leng = (X-x).^2 + (Y-y).^2 + ((-edge./2)-z).^2;
            %in order to find cos()
            %first find two vector and one dot another
            dotvec = (X-x).*0+(Y-y).*0+((-edge./2)-z).*(-edge);
            %second find the length of two vector and can find cos()
            Cos = dotvec./sqrt(leng)./edge;
            dE = k.*q./leng;
            Ie = Ie + dE.*dA.*Cos;
        end
    end
    %X=edge./2
    for Y=-(edge./2):accur:(edge./2)
        for Z=-(edge./2):accur:(edge./2)
            leng = ((edge./2)-x).^2 + (Y-y).^2 + (Z-z).^2;
            %in order to find cos()
            %first find two vector and one dot another
            dotvec = ((edge./2)-x).*edge+(Y-y).*0+(Z-z).*0;
            %second find the length of two vector and can find cos()
            Cos = dotvec./sqrt(leng)./edge;
            dE = k.*q./leng;
            Ie = Ie + dE.*dA.*Cos;
        end
    end
    %X=-edge./2
    for Y=-(edge./2):accur:(edge./2)
        for Z=-(edge./2):accur:(edge./2)
            leng = ((-edge./2)-x).^2 + (Y-y).^2 + (Z-z).^2;
            %in order to find cos()
            %first find two vector and one dot another
            dotvec = ((-edge./2)-x).*(-edge)+(Y-y).*0+(Z-z).*0;
            %second find the length of two vector and can find cos()
            Cos = dotvec./sqrt(leng)./edge;
            dE = k.*q./leng;
            Ie = Ie + dE.*dA.*Cos;
        end
    end
    %Y=edge./2
    for X=-(edge./2):accur:(edge./2)
        for Z=-(edge./2):accur:(edge./2)
            leng = (X-x).^2 + ((edge./2)-y).^2 + (Z-z).^2;
            %in order to find cos()
            %first find two vector and one dot another
            dotvec = (X-x).*0+((edge./2)-y).*edge+(Z-z).*0;
            %second find the length of two vector and can find cos()
            Cos = dotvec./sqrt(leng)./edge;
            dE = k.*q./leng;
            Ie = Ie + dE.*dA.*Cos;
        end
    end
    %Y=-edge./2
    for X=-(edge./2):accur:(edge./2)
        for Z=-(edge./2):accur:(edge./2)
            leng = (X-x).^2 + ((-edge./2)-y).^2 + (Z-z).^2;
            %in order to find cos()
            %first find two vector and one dot another
            dotvec = (X-x).*0+((-edge./2)-y).*(-edge)+(Z-z).*0;
            %second find the length of two vector and can find cos()
            Cos = dotvec./sqrt(leng)./edge;
            dE = k.*q./leng;
            Ie = Ie + dE.*dA.*Cos;
        end
    end
end