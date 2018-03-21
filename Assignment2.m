% Root Locus of 1 + KH(s)G(s)  = 0

% Plant OTLF
num = [0 1];
den = conv([1 0], conv([1 3], [1 6 20]));

% Draw Root Locus
G = tf(num, den);
% GC = feedback(G, 100);
% step(GC);
rlocus(G); grid on;