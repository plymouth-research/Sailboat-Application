function [ boatOutput ] = ActDubins( boat, boatconfig, u, velocity, dt )
%ACT Summary of this function goes here
%   Detailed explanation goes here
xp = velocity*cos(boat(3));
yp = velocity*sin(boat(3));
thetap = u;
vp = velocity - boat(4);
wp = thetap - boat(3);

boatOutput = boat + [ xp; yp; thetap; vp; wp; 0; 0; 0]*dt;
boatOutput(6) = u;
end

