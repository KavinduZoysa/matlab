duration = 3; m = 50;
y0 = -1.50; yd0 = 1.80;
% y0 = 0; yd0 = 0;
A = 10*m;

%Case1 : sigma^2 - rho > 0, over damped
b = 700; k = 125;
%Case1 : sigma^2 - rho = 0, critically damped
% b = 700; k = b^2/(4*m);
%Case1 : sigma^2 - rho < 0, under damped
% b = 250; k = 1100;

t=0 : 0.01 : duration;

sigma = b/(2*m); rho = k/m; eta = 1/m;
delta = sigma^2 - rho;

k_c = -rho/eta;
k_u = (sigma^2 - rho)/eta;

K = k_c + 6000;

syms s
F = eta / ((s^2 + 2*sigma*s + rho + K*eta)*s);
% F = 1/(s*(s - 1));
y = ilaplace(F);

% subplot(311); plot(t,y); axis([0 duration -5.0 15]);
ezplot(matlabFunction(y), [0, duration]); 
ylabel('Homogeneous Response [V]'); grid on;