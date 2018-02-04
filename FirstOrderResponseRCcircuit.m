%Constants
R1=1000; R2=2000; C=200*10^-6;
a=(R1+R2)/(R1*R2*C); b=1/(R1*C);

v0=2;
vIn=3;
duration=0.6;
t=0 : 0.01 : duration;

%Homogenous Response
yH=v0*exp(-a*t);

%Exogeneous Response
yE=vIn*(b/a)*(1-exp(-a*t));

%Total Response
yT=yH + yE;

subplot(311); plot(t,yH); axis([0 duration 0 4]);
ylabel('Homogeneous Response [V]'); grid on;

subplot(312); plot(t,yE); axis([0 duration 0 4]);
ylabel('Exogeneous Response [V]'); grid on;

subplot(313); plot(t,yT); axis([0 duration 0 4]);
ylabel('Total Response [V]'); grid on;