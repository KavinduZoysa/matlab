% Plant OLTF

% num = [1];
% den = conv([1,0],conv([1,3],[1,6,20]));
num = conv([1,-3],[1,4]);
den = conv([1,-1],[1,4,13]);

G = tf(num,den);
rlocus(G);
grid on;
