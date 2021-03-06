%hw1_2
%E=kQ/r^2
%Q = 1   Q is constant
for i=-11:1:11
    for n=-10:1:10
        leng = i.^2+n.^2;   %E inversely to r.^2
        %find the vector
        vectorx = [0 n];
        vectory = [0 i];
	%find the unit vector
        unitx = [(n./2) (n./2)+n./leng];
        unity = [(i./2) (i./2)+i./leng];
        PlotArrow(unitx,unity);
    end
end
hold on;
plot(0,0,'bo');
