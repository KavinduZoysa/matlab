PM = 45; ess = 0.01;

% open loop plant
num = conv([0 3], [1 3]);
den = conv([1 4], [1 3 20]);
G = tf(num, den);
bode(G); grid on; hold on;
[gainG, phaseG] = bode(G, 20);

% BW adjustment using a gain
K = 1/gainG;
G1 = K*G;
bode(G1); grid on; hold on;

% PM adjustment by lead componsator
phi = PM - (180 + phaseG);
z = 10.8; p = 400/z;
Cle = tf([1 z], [1 p]);

[gainLe, phaseLe] = bode(Cle, 20);

Kle = 1/gainLe;

G2 = Kle*Cle*G1;
bode(G2); grid on;hold on;

% Error adjustment by lag compensator
p1 = 0.1; z1 = 9.5*p1;
Cla = tf([1 z1], [1 p1]);
G3 = Cla*G2;
bode(G3); grid on; hold on;





