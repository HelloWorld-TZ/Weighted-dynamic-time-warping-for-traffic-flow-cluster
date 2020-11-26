function [] = calMax_Min(x, y1, y2)

plot(x, y1);
plot(x, y2);
maxY = max([y1; y2]); 
minY = min([y1; y2]); 
yFill = [maxY, fliplr(minY)];
xFill = [x, fliplr(x)];  % fliplrº¯Êý£º×óÓÒ·­×ª
fill(xFill, yFill, 'yellow'); 
hold on

end

