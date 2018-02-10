duration = 200;
t=0 : 0.01 : duration;

Ta = 10 - 0.05*t;
Tr = 10.75 - 0.05*t -0.75*exp(-t/15);

% plot(t,Ta); axis([0 duration -2 12]);
% ylabel('Temperature [V]'); grid on;

plot(t,Ta); hold on;
plot(t,Tr); 
axis([0 duration -2 12]);
ylabel('Temperature [V]'); grid on;
