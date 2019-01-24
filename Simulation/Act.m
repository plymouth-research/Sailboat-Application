function [ boatOutput ] = Act( boat, boatconfig, u, wind, dt )
%ACT Summary of this function goes here
%   Detailed explanation goes here
ksitw = wind(1);
atw = wind(2);
v = boat(4);
%{
max_sail = pi/2;

if(u(2) > max_sail)
    u(2) = max_sail;
end
%}
sigma = cos(boat(3)-wind(1)) + cos(u(2));
if (sigma < 0)
    u(2) = pi + boat(3)-wind(1);
else
    u(2) = sign(sin(boat(3)-wind(1)))*u(2);
end

Wcaw = [atw*cos(ksitw-boat(3))-abs(v); atw*sin(ksitw-boat(3))];
aaw = norm(Wcaw);
ksiaw = atan2(Wcaw(2),Wcaw(1));

%u(2) = -sign(ksiaw)*min(abs(pi-abs(ksiaw)),abs(u(2)));
gs = boatconfig.p4*aaw*sin(u(2)-ksiaw);
gr = boatconfig.p5*v*v*sin(u(1));

xp = v*cos(boat(3)) + boatconfig.p1*atw*cos(ksitw);
yp = v*sin(boat(3)) + boatconfig.p1*atw*sin(ksitw);
thetap = boat(5);
vp = (gs*sin(u(2)) - gr*boatconfig.p11*sin(u(1)) - boatconfig.p2*v*v)/boatconfig.p9;
wp = (gs*(boatconfig.p6-boatconfig.p7*cos(u(2))) - gr*boatconfig.p8*cos(u(1)) - boatconfig.p3*boat(5)*v)/boatconfig.p10;

boatOutput = boat + [ xp; yp; thetap; vp; wp; 0; 0; 0]*dt;
boatOutput(6) = u(1);
boatOutput(7) = u(2);
if(boatOutput(4) < 0)
    boatOutput(4) = 0;
end
end

