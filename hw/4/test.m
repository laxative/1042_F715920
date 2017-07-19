clear all;

edge = 4e-9;
epsilion = 1.66e-21;
sigma = 3.4e-10;
m = 40 .* 12 ./ 6.022 ./ 10 .^ 23;
h = 1e-12;
t = 0 : h : 1e-9;

%(a)
x1(1) = -2.5e-10;
y1(1) = 0;
x2(1) = 2.5e-10;
y2(1) = 0;
vx1(1) = 0;
vy1(1) = 0;
vx2(1) = 0;
vy2(1) = 0;
V(1) = 4 .* epsilion .* ((sigma ./ ((x1(1) - x2(1)) .^ 2 + (y1(1) - y2(1)) .^ 2) .^ 0.5) .^ 12 - (sigma ./ ((x1(1) - x2(1)) .^ 2 + (y1(1) - y2(1)) .^ 2) .^ 0.5) .^ 6);
F(1) = 4 .* epsilion .* (12 .* sigma .^ 12 ./ ((x1(1) - x2(1)) .^ 2 + (y1(1) - y2(1)) .^ 2) .^ 0.5 .^ 13 - 6 .* sigma .^ 6 ./ ((x1(1) - x2(1)) .^ 2 + (y1(1) - y2(1)) .^ 2) .^ 0.5 .^ 7);
ax1(1) = F(1) .* (x1(1) - x2(1)) ./ ((x1(1) - x2(1)) .^ 2 + (y1(1) - y2(1)) .^ 2) .^ 0.5 ./ m;
ay1(1) = F(1) .* (y1(1) - y2(1)) ./ ((x1(1) - x2(1)) .^ 2 + (y1(1) - y2(1)) .^ 2) .^ 0.5 ./ m;
ax2(1) = F(1) .* (x2(1) - x1(1)) ./ ((x1(1) - x2(1)) .^ 2 + (y1(1) - y2(1)) .^ 2) .^ 0.5 ./ m;
ay2(1) = F(1) .* (y2(1) - y1(1)) ./ ((x1(1) - x2(1)) .^ 2 + (y1(1) - y2(1)) .^ 2) .^ 0.5 ./ m;

plot(x1(1) , y1(1) , '*' , x2(1) , y2(1) , '*');
axis([-edge./2 edge./2 -edge./2 edge./2]);
M1(1) = getframe;

for i = 2 : 1e-9 ./ h + 1
    
    x1(i) = x1(i-1) + vx1(i-1) .* h + ax1(i-1) .* h .^ 2 ./ 2;
    y1(i) = y1(i-1) + vy1(i-1) .* h + ay1(i-1) .* h .^ 2 ./ 2;
    x2(i) = x2(i-1) + vx2(i-1) .* h + ax2(i-1) .* h .^ 2 ./ 2;
    y2(i) = y2(i-1) + vy2(i-1) .* h + ay2(i-1) .* h .^ 2 ./ 2;
    vx1(i) = vx1(i-1) + ax1(i-1) .* h;
    vy1(i) = vy1(i-1) + ay1(i-1) .* h;
    vx2(i) = vx2(i-1) + ax2(i-1) .* h;
    vy2(i) = vy2(i-1) + ay2(i-1) .* h;
    ax1(i) = F(i-1) .* (x1(i-1) - x2(i-1)) ./ ((x1(i-1) - x2(i-1)) .^ 2 + (y1(i-1) - y2(i-1)) .^ 2) .^ 0.5 ./ m;
    ay1(i) = F(i-1) .* (y1(i-1) - y2(i-1)) ./ ((x1(i-1) - x2(i-1)) .^ 2 + (y1(i-1) - y2(i-1)) .^ 2) .^ 0.5 ./ m;
    ax2(i) = F(i-1) .* (x2(i-1) - x1(i-1)) ./ ((x1(i-1) - x2(i-1)) .^ 2 + (y1(i-1) - y2(i-1)) .^ 2) .^ 0.5 ./ m;
    ay2(i) = F(i-1) .* (y2(i-1) - y1(i-1)) ./ ((x1(i-1) - x2(i-1)) .^ 2 + (y1(i-1) - y2(i-1)) .^ 2) .^ 0.5 ./ m;
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
    V(i) = 4 .* epsilion .* ((sigma ./ ((x1(i-1) - x2(i-1)) .^ 2 + (y1(i-1) - y2(i-1)) .^ 2) .^ 0.5) .^ 12 - (sigma ./ ((x1(i-1) - x2(i-1)) .^ 2 + (y1(i-1) - y2(i-1)) .^ 2) .^ 0.5) .^ 6);
    F(i) = 4 .* epsilion .* (12 .* sigma .^ 12 ./ ((x1(i-1) - x2(i-1)) .^ 2 + (y1(i-1) - y2(i-1)) .^ 2) .^ 0.5 .^ 13 - 6 .* sigma .^ 6 ./ ((x1(i-1) - x2(i-1)) .^ 2 + (y1(i-1) - y2(i-1)) .^ 2) .^ 0.5 .^ 7);
    
    plot(x1(i) , y1(i) , '*' , x2(i) , y2(i) , '*');
    axis([-edge./2 edge./2 -edge./2 edge./2]);
    M1(i) = getframe;
    
end

movie2avi(M1 , '(a).avi' , 'FPS' , 60);