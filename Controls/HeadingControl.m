function [ u ] = HeadingControl( boat, wind, heading )
%HEADINGCONTROL Summary of this function goes here
%   Detailed explanation goes here
rudder = 0;
max_rudder = pi/3;
if(cos(boat(3) - heading) >= 0)
    rudder = max_rudder*sin(boat(3) - heading);
else
    rudder = max_rudder*sign(sin(boat(3) - heading));
end

sail = pi/2*(cos(wind(1)-heading)+1)/2;

u=[rudder;sail];

end

