%Constants
R1=5000; R2=5000; C=200*10^-6;
a=(R1+R2)/(R1*R2*C); b=1/(R1*C);
duration = 10.0;

%Input
V = 2;

%Controller
k = 1;

t=0 : 0.01 : duration;

if k == -2.0
    y = b*V*t;
    u = V*(1 + a*t);
else 
    y = (b*V/(a+k*b))*(1 - exp(-(a+k*b)*t));
    u = (V/(a+k*b))*(a + k*b*exp(-(a+k*b)*t));
end

subplot(311); plot(t,y); axis([0 duration -1.0 5]);
ylabel('Output Voltage [V]'); grid on; hold on;

subplot(312); plot(t,u); axis([0 duration -1.0 5]);
ylabel('Control Voltage [V]'); grid on; hold on;

subplot(313); plot(t,y + u); axis([0 duration -1.0 5]);
ylabel('Control Voltage [V]'); grid on; hold on;
