function [ heading, q, tacking ] = TackingStrategy( boat, angle, heading, wind, distance, endpoint )
%TACKING Summary of this function goes here
%   Detailed explanation goes here
q = boat(8);
tack = pi/4;
corridor = 40;
offset = 3.5*[cos(angle) sin(angle)];
dist = (endpoint-offset)-boat(1:2)'; % offset for turn
ang = atan2(dist(2),dist(1));
if(abs(distance) > corridor/2 || (abs(distance) < corridor/2 && abs(cos(ang -(pi+wind(1)))) < cos(tack)))
    q = sign(distance);
end

tacking = false;
if((cos(wind(1)-heading)+cos(tack)<0) || (abs(distance)<corridor && cos(wind(1)-angle)+cos(tack)<0))
    heading = pi+wind(1)-q*tack;
    tacking = true;
end

end

