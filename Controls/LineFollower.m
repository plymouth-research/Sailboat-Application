function [ u, waypoints, q ] = LineFollower(boat, wind, waypoints)
%TACKING Summary of this function goes here
%   Detailed explanation goes here

P = 1.5;
q = boat(8);
if(size(waypoints,1) == 0)
    u = [0;0];
    return
end

rudder = 0;
max_rudder = pi/3;
toWaypoint = waypoints(2,:) - waypoints(1,:);

nearWaypoint = waypoints(2,:) - boat(1:2)';
if(norm(nearWaypoint) < 2)
    %waypoints(1,:) = [];
    disp('attained waypoint')
    u = [0;0];
    return
end

dist = boat(1:2)-waypoints(1,:)';
e = det([toWaypoint(1:2)'/norm(toWaypoint(1:2)) dist]);

phi = atan2(toWaypoint(2),toWaypoint(1));
heading = phi - 1/2*atan(e*P);
[heading, q, tackingt] = TackingStrategy(boat, phi, heading, wind, e, waypoints(2,:));

if(cos(boat(3) - heading) >= 0)
    rudder = max_rudder*sin(boat(3) - heading);
else
    rudder = max_rudder*sign(sin(boat(3) - heading));
end

if(tackingt)
    sail = abs(pi/3*(cos(wind(1)-heading)+1)/2);
else
    sail = abs(pi/2*(cos(wind(1)-heading)+1)/2);
end

u = [rudder;sail];
end