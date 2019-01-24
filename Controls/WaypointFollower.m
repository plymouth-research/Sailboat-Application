function [ u, waypoints ] = WaypointFollower(boat, wind, waypoints)
%WAYPOINTFOLLOWER Summary of this function goes here
%   Detailed explanation goes here
q = 1;
if(size(waypoints,1) == 0)
    u = [0;0];
    return
end

rudder = 0;
max_rudder = pi/3;
toWaypoint = waypoints(1,:) - [boat(1),boat(2)];
toWaypointn = toWaypoint/norm(toWaypoint);

if(norm(toWaypoint) < 4)
    waypoints(1,:) = [];
    disp('attained waypoint')
    u = [0;0];
    return
end

heading = atan2(toWaypointn(2),toWaypointn(1));

%[heading, q] = TackingStrategy(boat, q, heading, wind, 10);

if(cos(boat(3) - heading) >= 0)
    rudder = max_rudder*sin(boat(3) - heading);
else
    rudder = max_rudder*sign(sin(boat(3) - heading));
end

sail = pi/2*(cos(wind(1)-heading)+1)/2;
u = [rudder;sail];
end

