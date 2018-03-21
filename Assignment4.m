% complex conjugate poles
% omega = 10;
% seta = 0.1;
K = 91.32;
% K = 1;

num = K*5*[1 3];
den =  conv([1 10 2], [1 13 2]);

G = tf(num, den);
% subplot(121);

[gain, phase] = bode(G, 4)
bode(G); grid on; 

% complex conjugate zeroes
% omega = 10;
% seta = 0.1;
% 
% num = [1 2*omega*seta omega^2];
% den = [0 1];
% 
% G = tf(num, den);
% subplot(122)
% bode(G); grid on; hold on;