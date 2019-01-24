%% Initialization
clear

VDubins = 0.1;

boat = [0; 0; pi/4; VDubins; 0; 0; 0; 0]; % x y thetap vp w ur us q
dt = 0.6;
t = 0;
accel = 0;
wind = [0; 0.1];

waypoints = [-0.1, -0.1, pi/4];

run('BoatConfiguration');

%% Figures
%[f1,f2, plotPos, plotBoat, plotV, plotA] = CreateFiguresDubins(boat, [-20, 20], [-10, 30]);
[f1,f2, plotPos, plotBoat, plotV, plotA, qr, qs] = CreateFigures(boat, [-20, 20], [-10, 30], [0, 2000], [0, 0.2], [0, 2000], [-0.01, 0.01]);

figure(f1);
hold on;
plotWaypoint = plot3(boat(1),boat(2),0,'LineWidth',2,'Color','black');

path = dubins_restricted_curve(boat(1:3)', waypoints, 10, mod(wind(1)+pi,2*pi),pi/4,VDubins, false);
%pathWaypoint = path(10:end,:);
pathWaypoint = path;
%% Algorithm
while ishandle(f1) && ishandle(f2)
    t = t+dt;
    ct = ceil(t+1);
    vprev = boat(4);
    %u = [pi/3, pi/4*(1-sin(boat(3)))];
    u = PathFollower(boat, wind, path);
    %[u, pathWaypoint] = WaypointFollower(boat, wind, pathWaypoint(:,1:2));
    %{
    u = HeadingControl(boat, wind, pathWaypoint(1,3));
    if(abs(pathWaypoint(1,3) - boat(3)) < 0.05)
        pathWaypoint(1:2,:) = [];
        disp('heading attained');
    end
    %}
    %boat= ActDubins(boat, boatconfig, InputToDubins(u), VDubins, dt);
    boat= Act(boat, boatconfig, u, wind, dt);
    
    accel = (boat(4) - vprev)/dt;
    %% Drawing
    %DrawAllDubins(boat, boatconfig, accel, plotPos, plotBoat, plotV, plotA, t);
    DrawAll(boat, boatconfig, accel, plotPos, plotBoat, plotV, plotA, qr, qs, t);
    if(ct > size(path,1))
        ct = size(path,1);
    end
    plotWaypoint.XData = [plotWaypoint.XData path(ct,1)];
    plotWaypoint.YData = [plotWaypoint.YData path(ct,2)];
    plotWaypoint.ZData = [plotWaypoint.ZData 0];
    
    drawnow;
    %pause(dt);
    pause(0.00001);
end