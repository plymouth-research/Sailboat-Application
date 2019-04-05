function [ ] = DrawPacman( z1, z2, r, wind, range )
%DRAWPACMAN Summary of this function goes here
%   Detailed explanation goes here
Osr = z1(1:2) + [r*cos(z1(3)-pi/2), r*sin(z1(3)-pi/2)];
Osl = z1(1:2) + [r*cos(z1(3)+pi/2), r*sin(z1(3)+pi/2)];

Ofr = z2(1:2) + [r*cos(z2(3)-pi/2), r*sin(z2(3)-pi/2)];
Ofl = z2(1:2) + [r*cos(z2(3)+pi/2), r*sin(z2(3)+pi/2)];

thetaR = 0:0.1:2*pi;
thetaL = 0:0.1:2*pi;
thetaL(abs(wrapToPi(thetaL+pi/2-wind)) < range) = [];
thetaR(abs(wrapToPi(thetaR-pi/2-wind)) < range) = [];

plot(r*cos(thetaR)+Osr(1), r*sin(thetaR)+ Osr(2), '.', 'Color', 'red');
hold on;
plot(r*cos(thetaL)+Osl(1), r*sin(thetaL)+Osl(2), '.', 'Color', 'blue');
hold on;
quiver(z1(1), z1(2), cos(z1(3)), sin(z1(3)), 'Color', 'green', 'LineWidth', 1);
hold on;
plot(r*cos(thetaR)+Ofr(1), r*sin(thetaR)+ Ofr(2), '.', 'Color', 'red');
hold on;
plot(r*cos(thetaL)+Ofl(1), r*sin(thetaL)+Ofl(2), '.', 'Color', 'blue');
hold on;
quiver(z2(1), z2(2), cos(z2(3)), sin(z2(3)), 'Color', 'red', 'LineWidth', 1);
hold on;


sr1 = Osr+r*[cos(wind+range+pi/2), sin(wind+range+pi/2)];
sr2 = Osr+r*[cos(wind-range+pi/2), sin(wind-range+pi/2)];

sl1 = Osl+r*[cos(wind+range-pi/2), sin(wind+range-pi/2)];
sl2 = Osl+r*[cos(wind-range-pi/2), sin(wind-range-pi/2)];
line([Osr(1) sr1(1)], [Osr(2) sr1(2)], 'Color', 'red');
hold on;
line([Osr(1) sr2(1)], [Osr(2) sr2(2)], 'Color', 'red');
hold on;
line([Osl(1) sl1(1)], [Osl(2) sl1(2)], 'Color', 'blue');
hold on;
line([Osl(1) sl2(1)], [Osl(2) sl2(2)], 'Color', 'blue');
hold on;


pr1 = Ofr+r*[cos(wind+range+pi/2), sin(wind+range+pi/2)];
pr2 = Ofr+r*[cos(wind-range+pi/2), sin(wind-range+pi/2)];

pl1 = Ofl+r*[cos(wind+range-pi/2), sin(wind+range-pi/2)];
pl2 = Ofl+r*[cos(wind-range-pi/2), sin(wind-range-pi/2)];
line([Ofr(1) pr1(1)], [Ofr(2) pr1(2)], 'Color', 'red');
hold on;
line([Ofr(1) pr2(1)], [Ofr(2) pr2(2)], 'Color', 'red');
hold on;
line([Ofl(1) pl1(1)], [Ofl(2) pl1(2)], 'Color', 'blue');
hold on;
line([Ofl(1) pl2(1)], [Ofl(2) pl2(2)], 'Color', 'blue');
hold on;

end

