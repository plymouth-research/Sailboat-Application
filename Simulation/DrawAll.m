function [ ] = DrawAll( boat, boatconfig, accel, plotPos, plotBoat, plotV, plotA, qR, qS, t )
%DRAWALL Summary of this function goes here
%   Detailed explanation goes here

    plotPos.XData = [plotPos.XData boat(1)];
    plotPos.YData = [plotPos.YData boat(2)];
    plotPos.ZData = [plotPos.ZData 0];
    
    plotV.XData = [plotV.XData t];
    plotV.YData = [plotV.YData boat(4)];
    
    plotA.XData = [plotA.XData t];
    plotA.YData = [plotA.YData accel];

    qR.XData = boat(1)-cos(boat(3))*boatconfig.p8;
    qR.YData = boat(2)-sin(boat(3))*boatconfig.p8;
    qR.UData = cos(boat(6)+boat(3)+pi)*0.4;
    qR.VData = sin(boat(6)+boat(3)+pi)*0.4;

    qS.XData = boat(1)+cos(boat(3))*boatconfig.p7;
    qS.YData = boat(2)+sin(boat(3))*boatconfig.p7;
    qS.UData = cos(boat(7)+boat(3)+pi);
    qS.VData = sin(boat(7)+boat(3)+pi);
    
    plotBoat.XData = boat(1)-cos(boat(3))*boatconfig.p8;
    plotBoat.YData = boat(2)-sin(boat(3))*boatconfig.p8;
    plotBoat.UData = cos(boat(3))*boatconfig.p8*2;
    plotBoat.VData = sin(boat(3))*boatconfig.p8*2;
end

