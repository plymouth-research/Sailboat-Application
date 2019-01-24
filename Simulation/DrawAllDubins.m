function [ ] = DrawAllDubins( boat, boatconfig, accel, plotPos, plotBoat, plotV, plotA, t )
%DRAWALL Summary of this function goes here
%   Detailed explanation goes here

    plotPos.XData = [plotPos.XData boat(1)];
    plotPos.YData = [plotPos.YData boat(2)];
    plotPos.ZData = [plotPos.ZData 0];
    
    plotV.XData = [plotV.XData t];
    plotV.YData = [plotV.YData boat(4)];
    
    plotA.XData = [plotA.XData t];
    plotA.YData = [plotA.YData accel];
    
    plotBoat.XData = boat(1);
    plotBoat.YData = boat(2);
    plotBoat.UData = cos(boat(3));
    plotBoat.VData = sin(boat(3));
end

