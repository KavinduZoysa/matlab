% dur = 10;
% 
% eta = 0.025;
% rho = 5;
% sigma = 3.75;
% 
% num = [0 eta];
% den = [1 2*sigma 5];
% 
% G = tf(num, den);
% 
% step(G,num); axis([0 dur 0 1.5]); grid on;

% Plant OLTF
num = [1 9 18];
% num = [1];
den = conv([1,2],conv([1,5],[1,3,6]));
% num = conv([1,-3],[1,4]);
% den = conv([1,-1],[1,4,13]);

G = tf(num,den);
dur = 20;
rlocus(G);
grid on;

% K = 20;
% cltf1 = feedback(G,K);
% step(cltf1,dur); hold on;
% 
% K = 30;
% cltf1 = feedback(G,K);
% step(cltf1,dur); hold on;
% 
% K = 150;
% cltf1 = feedback(G,K);
% step(cltf1,dur); hold on;
% 
% K = 240;
% cltf1 = feedback(G,K);
% step(cltf1,dur); hold on;