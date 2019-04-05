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
[f1,f2, plotPos, plotBoat, plotV, plotA, qr, qs] = CreateFigures(boat, [-20, 100], [-10, 100], [0, 2000], [0, 0.2], [0, 2000], [-0.01, 0.01]);

figure(f1);
hold on;
plotWaypoint = plot3(boat(1),boat(2),0,'LineWidth',0.5,'Color','black');
%14.4853
path = dubins_restricted_curve(boat(1:3)', waypoints, 14.5, mod(wind(1)+pi,2*pi),pi/4-0.001,VDubins, false);
pathWaypoint = path;

plotWaypoint.XData = [plotWaypoint.XData path(:,1)'];
plotWaypoint.YData = [plotWaypoint.YData path(:,2)'];
plotWaypoint.ZData = [plotWaypoint.ZData zeros(1,size(path,1))];
%% Simulation
while ishandle(f1) && ishandle(f2)
    t = t+dt;
    ct = ceil(t+1);
    vprev = boat(4);
    u = PathFollower(boat, wind, path);
    boat= Act(boat, boatconfig, u, wind, dt);
    
    accel = (boat(4) - vprev)/dt;
    %% Drawing
    DrawAll(boat, boatconfig, accel, plotPos, plotBoat, plotV, plotA, qr, qs, t);
    
    figure(f1);
    axis([-60 60 -20 70])
    drawnow;
    %pause(dt);
    pause(0.00001);
end