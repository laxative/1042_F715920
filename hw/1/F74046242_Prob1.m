%hw1-1
%first number = 0.03
bit = [0 0 1 1 1 1 0 0 1 1 1 1 0 1 0 1 1 1 0 0 0 0 1 0 1 0 0 0 1 1 1 1];
ansnum = SngBinToNum(bit);
num = 0.03;
[ansbit] = NumToSngBin(num);
fprintf(1,'The binary representation of %.6f is [',num);
for i=1:32
    fprintf(1,'%d',ansbit(i));
end
fprintf(1,']\nThe decimal representation of [');
for i=1:32
    fprintf(1,'%d',bit(i));
end
fprintf(1,'] is %.6f\n',ansnum);
%second number = 2.4
bit = [0 1 0 0 0 0 0 0 0 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 1 0];
ansnum = SngBinToNum(bit);
num = 2.4;
[ansbit] = NumToSngBin(num);
fprintf(1,'The binary representation of %.6f is [',num);
for i=1:32
    fprintf(1,'%d',ansbit(i));
end
fprintf(1,']\nThe decimal representation of [');
for i=1:32
    fprintf(1,'%d',bit(i));
end
fprintf(1,'] is %.6f\n',ansnum);
%third number = -5.878
bit = [1 1 0 0 0 0 0 0 1 0 1 1 1 1 0 0 0 0 0 1 1 0 0 0 1 0 0 1 0 0 1 1];
ansnum = SngBinToNum(bit);
num = -5.878;
[ansbit] = NumToSngBin(num);
fprintf(1,'The binary representation of %.6f is [',num);
for i=1:32
    fprintf(1,'%d',ansbit(i));
end
fprintf(1,']\nThe decimal representation of [');
for i=1:32
    fprintf(1,'%d',bit(i));
end
fprintf(1,'] is %.6f\n',ansnum);