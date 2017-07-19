clear all;
clc;
edge = 4e-9; %(m)
N = 6.02e+23;
Sigma = 3.4e-10; %(m)
epsilon = 1.66e-21; %(J)
m = 40.*12./N;
h = 1e-12;
t = 0:h:1e-9;

%(a)
x1(1) = -2.5e-10;
y1(1) = 0;
x2(1) = 2.5e-10;
y2(1) = 0;
%all velocity is 0
vx1(1) = 0;
vy1(1) = 0;
vx2(1) = 0;
vy2(1) = 0;
%using formula to calculate
V(1) = 4.*epsilon.*((Sigma./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2)).^12-(Sigma./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2).^6));
F(1) = 4.*epsilon.*(12.*Sigma.^12./sqrt((x1(1) - x2(1)).^2 +(y1(1)-y2(1)).^2).^13-6.*Sigma.^6./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2).^7);
ax1(1) = F(1).*(x1(1)-x2(1))./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2)./m;
ay1(1) = F(1).*(y1(1)-y2(1))./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2)./m;
ax2(1) = F(1).*(x2(1)-x1(1))./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2)./m;
ay2(1) = F(1).*(y2(1)-y1(1))./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2)./m;

plot(x1(1),y1(1),'*',x2(1),y2(1),'*');
axis([-edge./2 edge./2 -edge./2 edge./2]);
M1(1) = getframe;

%do for gif
%use euler method

for i=2:1e-9./h+1
    x1(i) = x1(i-1) + h.*vx1(i-1) + ax1(i-1).*h.^2./2;
    y1(i) = y1(i-1) + h.*vy1(i-1) + ay1(i-1).*h.^2./2;
    x2(i) = x2(i-1) + h.*vx2(i-1) + ax2(i-1).*h.^2./2;
    y2(i) = y2(i-1) + h.*vy2(i-1) + ay2(i-1).*h.^2./2;
    vx1(i) = vx1(i-1) + h.*ax1(i-1);
    vy1(i) = vy1(i-1) + h.*ay1(i-1);
    vx2(i) = vx2(i-1) + h.*ax2(i-1);
    vy2(i) = vy2(i-1) + h.*ay2(i-1);
    ax1(i) = F(i-1).*(x1(i-1)-x2(i-1))./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)./m;
    ay1(i) = F(i-1).*(y1(i-1)-y2(i-1))./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)./m;
    ax2(i) = F(i-1).*(x2(i-1)-x1(i-1))./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)./m;
    ay2(i) = F(i-1).*(y2(i-1)-y1(i-1))./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)./m;
    %check for the thing out of the range(hit the edge)
    if x1(i) <= -edge ./ 2 || edge ./ 2  <= x1(i)
        vx1(i) = -vx1(i);
        ax1(i) = -ax1(i);
    end
    if y1(i) <= -edge ./ 2 || edge ./ 2  <= y1(i)
        vy1(i) = -vy1(i);
        ay1(i) = -ay1(i);
    end
    if x2(i) <= -edge ./ 2 || edge ./ 2  <= x2(i)
        vx2(i) = -vx2(i);
        ax2(i) = -ax2(i);
    end
    if y2(i) <= -edge ./ 2 || edge ./ 2  <= y2(i)
        vy2(i) = -vy2(i);
        ay2(i) = -ay2(i);
    end
    V(i) = 4.*epsilon.*((Sigma./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)).^12-(Sigma./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2).^6));
    F(i) = 4.*epsilon.*(12.*Sigma.^12./sqrt((x1(i-1) - x2(i-1)).^2 +(y1(i-1)-y2(i-1)).^2).^13-6.*Sigma.^6./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2).^7);
    plot(x1(i),y1(i),'*',x2(i),y2(i),'*');
    axis([-edge./2 edge./2 -edge./2 edge./2]);
    M1(i) = getframe;
end    
    movie2avi(M1,'(a).avi','FPS',60);
    
%(b)
%same as (a), just for three thing......
x1(1) = -1e-9;
y1(1) = 0;
x2(1) = 1e-9;
y2(1) = 1.9082e-10;
x3(1) = 1e-9;
y3(1) = -1.9082e-10;
vx1(1) = 300;
vy1(1) = 0;
vx2(1) = 0;
vy2(1) = 0;
vx3(1) = 0;
vy3(1) = 0;
V1(1) = 4.*epsilon.*((Sigma./sqrt((x1(1)- x2(1)).^2+(y1(1)-y2(1)).^2).^12-(Sigma./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2)).^6));
F1(1) = 4.*epsilon.*(12.*Sigma.^12./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2).^13-6.*Sigma.^6./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2).^7);
V2(1) = 4.*epsilon.*((Sigma./sqrt((x1(1)- x3(1)).^2+(y1(1)-y3(1)).^2).^ 12-(Sigma./sqrt((x1(1)-x3(1)).^2+(y1(1)-y3(1)).^2).^6)));
F2(1) = 4.*epsilon.*(12.*Sigma.^12./sqrt((x1(1)-x3(1)).^2+(y1(1)-y3(1)).^2).^13-6.*Sigma.^6./sqrt((x1(1)-x3(1)).^2+(y1(1)-y3(1)).^2).^7);
V3(1) = 4.*epsilon.*((Sigma./sqrt((x3(1)- x2(1)).^2+(y3(1)-y2(1)).^2).^ 12-(Sigma./sqrt((x3(1)-x2(1)).^2+(y3(1)-y2(1)).^2)).^6));
F3(1) = 4.*epsilon.*(12.*Sigma.^12./sqrt((x3(1)-x2(1)).^2+(y3(1)-y2(1)).^2).^13-6.*Sigma.^6./sqrt((x3(1)-x2(1)).^2+(y3(1)-y2(1)).^2).^7);
ax1(1) = F1(1).*(x1(1)-x2(1))./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2)./m+F2(1).*(x1(1)-x3(1))./sqrt((x1(1)-x3(1)).^2+(y1(1)-y3(1)).^2)./m;
ay1(1) = F1(1).*(y1(1)-y2(1))./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2)./m+F2(1).*(y1(1)-y3(1))./sqrt((x1(1)-x3(1)).^2+(y1(1)-y3(1)).^2)./m;
ax2(1) = F1(1).*(x2(1)-x1(1))./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2)./m+F3(1).*(x2(1)-x3(1))./sqrt((x2(1)-x3(1)).^2+(y2(1)-y3(1)).^2)./m;
ay2(1) = F1(1).*(y2(1)-y1(1))./sqrt((x1(1)-x2(1)).^2+(y1(1)-y2(1)).^2)./m+F3(1).*(y2(1)-y3(1))./sqrt((x2(1)-x3(1)).^2+(y2(1)-y3(1)).^2)./m;
ax3(1) = F2(1).*(x3(1)-x1(1))./sqrt((x1(1)-x3(1)).^2+(y1(1)-y3(1)).^2)./m+F3(1).*(x3(1)-x2(1))./sqrt((x2(1)-x3(1)).^2+(y2(1)-y3(1)).^2)./m;
ay3(1) = F2(1).*(y3(1)-y1(1))./sqrt((x1(1)-x3(1)).^2+(y1(1)-y3(1)).^2)./m+F3(1).*(y3(1)-y2(1))./sqrt((x2(1)-x3(1)).^2+(y2(1)-y3(1)).^2)./m;

plot(x1(1),y1(1),'*',x2(1),y2(1),'*',x3(1),y3(1),'*');
axis([-edge./2 edge./2 -edge./2 edge./2]);
M2(1) = getframe;

for i=2:1e-9./h+1
    
    x1(i) = x1(i-1) + vx1(i-1) .* h + ax1(i-1) .* h .^ 2 ./ 2;
    y1(i) = y1(i-1) + vy1(i-1) .* h + ay1(i-1) .* h .^ 2 ./ 2;
    x2(i) = x2(i-1) + vx2(i-1) .* h + ax2(i-1) .* h .^ 2 ./ 2;
    y2(i) = y2(i-1) + vy2(i-1) .* h + ay2(i-1) .* h .^ 2 ./ 2;
    x3(i) = x3(i-1) + vx3(i-1) .* h + ax3(i-1) .* h .^ 2 ./ 2;
    y3(i) = y3(i-1) + vy3(i-1) .* h + ay3(i-1) .* h .^ 2 ./ 2;
    vx1(i) = vx1(i-1) + ax1(i-1) .* h;
    vy1(i) = vy1(i-1) + ay1(i-1) .* h;
    vx2(i) = vx2(i-1) + ax2(i-1) .* h;
    vy2(i) = vy2(i-1) + ay2(i-1) .* h;
    vx3(i) = vx3(i-1) + ax3(i-1) .* h;
    vy3(i) = vy3(i-1) + ay3(i-1) .* h;
    ax1(i) = F1(i-1).*(x1(i-1)-x2(i-1))./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)./m+F2(i-1).*(x1(i-1)-x3(i-1))./sqrt((x1(i-1)-x3(i-1)).^2+(y1(i-1)-y3(i-1)).^2)./m;
    ay1(i) = F1(i-1).*(y1(i-1)-y2(i-1))./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)./m+F2(i-1).*(y1(i-1)-y3(i-1))./sqrt((x1(i-1)-x3(i-1)).^2+(y1(i-1)-y3(i-1)).^2)./m;
    ax2(i) = F1(i-1).*(x2(i-1)-x1(i-1))./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)./m+F3(i-1).*(x2(i-1)-x3(i-1))./sqrt((x2(i-1)-x3(i-1)).^2+(y2(i-1)-y3(i-1)).^2)./m;
    ay2(i) = F1(i-1).*(y2(i-1)-y1(i-1))./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)./m+F3(i-1).*(y2(i-1)-y3(i-1))./sqrt((x2(i-1)-x3(i-1)).^2+(y2(i-1)-y3(i-1)).^2)./m;
    ax3(i) = F2(i-1).*(x3(i-1)-x1(i-1))./sqrt((x1(i-1)-x3(i-1)).^2+(y1(i-1)-y3(i-1)).^2)./m+F3(i-1).*(x3(i-1)-x2(i-1))./sqrt((x2(i-1)-x3(i-1)).^2+(y2(i-1)-y3(i-1)).^2)./m;
    ay3(i) = F2(i-1).*(y3(i-1)-y1(i-1))./sqrt((x1(i-1)-x3(i-1)).^2+(y1(i-1)-y3(i-1)).^2)./m+F3(i-1).*(y3(i-1)-y2(i-1))./sqrt((x2(i-1)-x3(i-1)).^2+(y2(i-1)-y3(i-1)).^2)./m;
    if x1(i) <= -edge ./ 2 || edge ./ 2  <= x1(i)
        vx1(i) = -vx1(i);
        ax1(i) = -ax1(i);
    end
    if y1(i) <= -edge ./ 2 || edge ./ 2  <= y1(i)
        vy1(i) = -vy1(i);
        ay1(i) = -ay1(i);
    end
    if x2(i) <= -edge ./ 2 || edge ./ 2  <= x2(i)
        vx2(i) = -vx2(i);
        ax2(i) = -ax2(i);
    end
    if y2(i) <= -edge ./ 2 || edge ./ 2  <= y2(i)
        vy2(i) = -vy2(i);
        ay2(i) = -ay2(i);
    end
    if x3(i) <= -edge ./ 2 || edge ./ 2  <= x3(i)
        vx3(i) = -vx3(i);
        ax3(i) = -ax3(i);
    end
    if y3(i) <= -edge ./ 2 || edge ./ 2  <= y3(i)
        vy3(i) = -vy3(i);
        ay3(i) = -ay3(i);
    end
    V1(i) = 4.*epsilon.*((Sigma./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)).^12-(Sigma./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2)).^6);
    F1(i) = 4.*epsilon.*(12.*Sigma.^12./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2).^13-6.*Sigma.^6./sqrt((x1(i-1)-x2(i-1)).^2+(y1(i-1)-y2(i-1)).^2).^7);
    V2(i) = 4.*epsilon.*((Sigma./sqrt((x1(i-1)-x3(i-1)).^2+(y1(i-1)-y3(i-1)).^2)).^12-(Sigma./sqrt((x1(i-1)-x3(i-1)).^2+(y1(i-1)-y3(i-1)).^2)).^6);
    F2(i) = 4.*epsilon.*(12.*Sigma.^12./sqrt((x1(i-1)-x3(i-1)).^2+(y1(i-1)-y3(i-1)).^2).^13-6.*Sigma.^6./sqrt((x1(i-1)-x3(i-1)).^2+(y1(i-1)-y3(i-1)).^2).^7);
    V3(i) = 4.*epsilon.*((Sigma./sqrt((x3(i-1)-x2(i-1)).^2+(y3(i-1)-y2(i-1)).^2)).^12-(Sigma./sqrt((x3(i-1)-x2(i-1)).^2+(y3(i-1)-y2(i-1)).^2)).^6);
    F3(i) = 4.*epsilon.*(12.*Sigma.^12./sqrt((x3(i-1)-x2(i-1)).^2+(y3(i-1)-y2(i-1)).^2).^13-6.*Sigma.^6./sqrt((x3(i-1)-x2(i-1)).^2+(y3(1)-y2(1)).^2).^7);
    
    plot(x1(i),y1(i),'*',x2(i),y2(i),'*',x3(i),y3(i),'*');
    axis([-edge./2 edge./2 -edge./2 edge./2]);
    M2(i) = getframe;
    
end

movie2avi(M2,'(b).avi','FPS',60);