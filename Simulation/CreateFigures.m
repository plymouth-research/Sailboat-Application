function [ f1, f2, plotPos, plotBoat, plotV, plotA, quiverR, quiverS ] = CreateFigures( boat, rangeX, rangeY, rangeVX, rangeVY, rangeAX, rangeAY, f1, f2 )
%CREATEFIGURES Summary of this function goes here
%   Detailed explanation goes here
if nargin < 3
    error('Function requires at least three inputs.');
end
if nargin < 4
    rangeVX = [0, 400];
end
if nargin < 5
    rangeVY = [-2, 5];
end
if nargin < 6
    rangeAX = [0, 400];
end
if nargin < 7
    rangeAY = [-0.5, 0.5];
end
if nargin < 8
    f1=0;
    f2=0;
end

c1 = 'red';
if(f1~=0 && f2 ~= 0)
    c1 = 'blue';
end
    
if(f1~=0)
    figure(f1);
else
    f1 = figure('Name','Boat Trajectory', 'Position', [10 10 900 600]);
end
title('Boat Path');
hold on;
plotPos = plot3(boat(1),boat(2),0,'LineWidth',2,'Color',c1);
hold on;
quiverR = quiver(boat(1), boat(2), 0, 0, 'Color', 'blue');
hold on;
quiverS = quiver(boat(1), boat(2), 0, 0, 'Color', 'green');
hold on;
plotBoat = quiver(boat(1),boat(2), 0,0, 'Color', 'black');
hold on;
axis([rangeX(1), rangeX(2),rangeY(1),rangeY(2),-20,20]);

if(f2~=0)
    figure(f2);
else
    f2 = figure('Name','Boat');
end
hold on;
subplot(2,1,1);
plotV = plot(0,boat(4),'LineWidth',2,'Color',c1);
hold on;
title('Velocity');
axis([rangeVX(1), rangeVX(2),rangeVY(1),rangeVY(2)]);
subplot(2,1,2);
plotA = plot(0,0,'LineWidth',2,'Color',c1);
hold on;
title('Acceleration');
axis([rangeAX(1), rangeAX(2),rangeAY(1),rangeAY(2)]);

end

