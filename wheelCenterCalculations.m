inch2mm = 25.4; %mm/inch

tierDiameter = 10 *inch2mm; % 10" Hoosier
tierRadius = tierDiameter / 2;

boltSize = 6; %mm or M6,
gearboxDiameter = 110; %mm
minBoltArm = ( gearboxDiameter / 2 ) + boltSize; %mm
maxBoltArm = 244 - boltSize; %mm - from CAD.
boltArms = [minBoltArm:0.2:maxBoltArm]; 


% 2g Bump + brake
Fz = 3418; %N
Fx = 3611; %N
Fy = 0;    %N

% Moment around wheel center = 0
% Fx  * tierRadius + lowerBolt * boltArm + upperBolt * boltArm = 0
% Sum of FX = 0;
% lowerBolt - upperBolt + Fx = 0
% lowerBolt = -(-upperBolt + Fx);
% => Fx  * tierRadius + -(upperBolt + Fx) * boltArm + upperBolt * boltArm = 0
% => Fx  * (tierRadius - boltArm) + upperBolt * boltArm + upperBolt * boltArm = 0
upperBolt = -Fx .* (tierRadius - boltArms) ./ (boltArms .* 2);
lowerBolt = -(-upperBolt + Fx);

figure;
grid on; hold on;
plot(boltArms, upperBolt)
plot(boltArms, lowerBolt)
text(80,-1500, ['Min upper bolt ', num2str(min(upperBolt),5), 'N'])
text(180,-1500, ['Max upper bolt ', num2str(max(upperBolt),5), 'N'])
text(100,-5000, ['Min lower bolt ', num2str(min(lowerBolt),5), 'N'])
text(180,-4000, ['Max lower bolt ', num2str(max(lowerBolt),5), 'N'])
title('2g Bump + brake, Fx positive direction, two spoke design')
xlabel('Distance from center [mm]')
ylabel('Force [N]')
legend('Uppper bolt', 'Lower bolt')



% 2g Bump + turn
Fz = 3674; %N
Fx = 0;    %N
Fy = 3254; %N

upperBolt_t = -Fy .* (tierRadius - boltArms) ./ (boltArms .* 2);
lowerBolt_t = -(-upperBolt + Fx);

figure;
grid on; hold on;
plot(boltArms, upperBolt_t)
plot(boltArms, lowerBolt_t)
text(80,-1500, ['Min upper bolt ', num2str(min(upperBolt_t),5), 'N'])
text(180,-1500, ['Max upper bolt ', num2str(max(upperBolt_t),5), 'N'])
text(100,-1000, ['Min lower bolt ', num2str(min(lowerBolt_t),5), 'N'])
text(180,-1000, ['Max lower bolt ', num2str(max(lowerBolt_t),5), 'N'])
title('2g Bump + trun, Fy positive direction, two spoke design')
xlabel('Distance from center [mm]')
ylabel('Force [N]')
legend('Uppper bolt', 'Lower bolt')
