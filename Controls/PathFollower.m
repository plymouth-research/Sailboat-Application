function [ u, path ] = PathFollower( boat, wind, path, P)
if nargin < 4
     P = 2.5;
end
%PATHFOLLOWER Summary of this function goes here
%   Detailed explanation goes here
rudder = 0;
max_rudder = pi/3;

A = repmat(boat(1:2)',size(path,1),1) - path(:,1:2);
norms = sum(A.^2,2);
iclosest = find(norms == min(norms));
closest = path(iclosest(1)+2,:);
line = [closest(1)+cos(closest(3)) closest(2)+sin(closest(3)) 0] - closest;

dist = boat(1:2)-closest(1:2)';
e = det([line(1:2)'/norm(line(1:2)) dist]);

phi = closest(3);
heading = phi - 1/2*atan(e*P);
if(cos(boat(3) - heading) >= 0)
    rudder = max_rudder*sin(boat(3) - heading);
else
    rudder = max_rudder*sign(sin(boat(3) - heading));
end

sail = abs(pi/3*(cos(wind(1)-heading)+1)/2);
%sail = pi/4*(1-sin(boat(3)));

u=[rudder;sail];
if(iclosest > 1)
    path = path(iclosest-1:end,:);
end

end

