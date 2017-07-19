function PlotArrow(a,b)
    line(a,b);
    hold on;
    %line the shape of arrow
    arrow1x = [a(2),(a(1)./4+a(2).*3./4)+(b(2)-b(1))./8];
    arrow1y = [b(2),(b(1)./4+b(2).*3./4)+(a(1)-a(2))./8];
    arrow2x = [a(2),(a(1)./4+a(2).*3./4)-(b(2)-b(1))./8];
    arrow2y = [b(2),(b(1)./4+b(2).*3./4)-(a(1)-a(2))./8];
    line(arrow1x,arrow1y);
    hold on;
    line(arrow2x,arrow2y);
    axis([-6,6,-5,5]);  %set the plot arrange
    set(gca,'XTick',-6:1:6,'YTick',-5:1:5); %set x and y
    title('Electrical Field');
    xlabel('x');
    ylabel('y');
end