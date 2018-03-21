duration = 25; m = 40;
y0 = 0; yd0 = 0;
% y0 = 0; yd0 = 0;
A = 10*m;

%Case1 : sigma^2 - rho > 0, over damped
b = 300; k = 200;
%Case1 : sigma^2 - rho = 0, critically damped
% b = 700; k = b^2/(4*m);
%Case1 : sigma^2 - rho < 0, under damped
% b = 250; k = 1100;

sigma = b/(2*m); rho = k/m; eta = 1/m;
delta = sigma^2 - rho;

t=0 : 0.01 : duration;

k1 = y0; k2 = 2*sigma*y0 + yd0;
if delta > 0 
    alpha1 = -sigma + sqrt(delta);
    alpha2 = -sigma - sqrt(delta);

    p1 = (k1*alpha1 + k2)/(alpha1 - alpha2);
    p2 = (k1*alpha2 + k2)/(alpha2 - alpha1);

    q1 = 1/(alpha1*(alpha1 - alpha2));
    q2 = 1/(alpha2*(alpha2 - alpha1));
    q3 = 1/(alpha1*alpha2);

    yH = p1*exp(alpha1*t) + p2*exp(alpha2*t);
    yE = eta*A*(q3 + q1*exp(alpha1*t) + q2*exp(alpha2*t));
    h1 = tf([1, 2*sigma, rho], -1);
    subplot(311); rlocus(h1); grid on;
elseif delta == 0
    alpha = -sigma;
    p5 = (k1*alpha + k2)/alpha; p6 = -k2/alpha; p7 = 1/alpha; p8 = -p7;
    
    yH = exp(alpha*t)*(p6 + p5) + p5*alpha*t.*exp(alpha*t);
    yE = eta*A*(-p7*t.*exp(alpha*t) + p8*(exp(alpha*t)-1)/alpha);
    h2 = tf([1, 2*sigma, rho], -1);
    subplot(312); rlocus(h2); grid on;
else
    omega = sqrt(-delta);
    phiH = atan2(k1, (k2 - k1*sigma)/omega);
    phiE = atan2(omega, sigma);
    K = sqrt(k1^2 + ((k2-k1*sigma)/omega)^2);
    
    yH = K*exp(-sigma*t).*sin(omega*t+phiH);
    yE1 = exp(-sigma*t).*sin(omega*t+phiE);
    yE = eta*A*(omega/(omega^2 + sigma^2) - yE1)/omega;
    h3 = tf([1, 2*sigma, rho], -1);
    subplot(313); rlocus(h3); grid on;
end    

% h = tf([1, 2*sigma, rho], -1);
yT = yH + yE;

% subplot(311); plot(t,yH); axis([0 duration -2.8 15]);
% ylabel('Homogeneous Response [V]'); grid on;
% 
% subplot(312); plot(t,yE); axis([0 duration -2.8 15]);
% ylabel('Exogeneous Response [V]'); grid on;
% 
% subplot(313); plot(t,yT); axis([0 duration -2.8 15]);
% ylabel('Total Response [V]'); grid on;

subplot(311); plot(t,yH); axis([0 duration -5.0 15]);
ylabel('Homogeneous Response [V]'); grid on;

subplot(312); plot(t,yE); axis([0 duration -5.0 15]);
ylabel('Exogeneous Response [V]'); grid on;

subplot(313); plot(t,yT); axis([0 duration -5.0 15]);
ylabel('Total Response [V]'); grid on;




 