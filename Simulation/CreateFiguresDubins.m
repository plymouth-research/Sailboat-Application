function [ f1, f2, plotPos, plotBoat, plotV, plotA] = CreateFiguresDubins( boat, rangeX, rangeY )
%CREATEFIGURES Summary of this function goes here
%   Detailed explanation goes here
f1 = figure('Name','Boat Trajectory');
title('Boat Path');
hold on;
plotPos = plot3(boat(1),boat(2),0,'LineWidth',2,'Color','red');
hold on;
plotBoat = quiver(boat(1),boat(2), 0,0, 'Color', 'black');
axis([rangeX(1), rangeX(2),rangeY(1),rangeY(2),-20,20]);

f2 = figure('Name','Boat');
subplot(2,1,1);
plotV = plot(0,boat(4),'LineWidth',2,'Color','red');
title('Velocity');
axis([0, 400,-2,5]);
subplot(2,1,2);
plotA = plot(0,0,'LineWidth',2,'Color','red');
title('Acceleration');
axis([0, 400,-0.5,0.5]);

end

