num = 10e+6;
inside = 0;
for i=1:num
    x=rand*10-5;
    y=rand*10-5;
    z=rand*10-5;
    if ((x.^2)./4) + (y.^2) + ((z.^2)./9) <= 1
        inside = inside + 1;
    end
end
ans = 1000.*(inside)./num;
fprintf(1,'A total of %d random points are used and the volume of the ellipsoid is %.8f.',num,ans);