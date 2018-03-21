c = 100;
b = 2;

omega_n = sqrt(c);
seta = b/(2*omega_n);
k = 1;

num = k*[0 omega_n^2];
den = [1 2*seta*omega_n omega_n^2];

G = tf(num,den)

seta
omega_n
omega_d = omega_n * sqrt(1 - seta^2)

tr = 1.8/omega_n
po = exp((-seta*pi)/sqrt(1 - seta^2))
ts = 4.6/(seta*omega_n)
phi = atan2(omega_d, seta*omega_n)

step(G); grid on;