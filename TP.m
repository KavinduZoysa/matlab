% position A
q_A1 = 0.9828;
q_A2 = -0.6269;
q_A3 = 1.7949;
% velocity A
q_A1v = 0;
q_A2v = 0;
q_A3v = 0;

% position B
q_B1 = 1.2490;
q_B2 = -0.1651;
q_B3 = 1.6682;
% velocity B
q_B1v = 0.1;
q_B2v = 0.1;
q_B3v = 0.1;

% position C
q_C1 = 0.5880; 
q_C2 = 0.0206;
q_C3 = 1.3467;
% velocity C
q_C1v = 0;
q_C2v = 0;
q_C3v = 0;

q_A = [q_A1; q_A2; q_A3;];
q_B = [q_B1; q_B2; q_B3;];
q_C = [q_C1; q_C2; q_C3;];

q_Av = [q_A1v; q_A2v; q_A3v;];
q_Bv = [q_B1v; q_B2v; q_B3v;];
q_Cv = [q_C1v; q_C2v; q_C3v;];

T = 10;

% First segment
a0 = q_A;
a1 = q_Av; 
a2 = (3*(q_B - q_A) - q_Bv*T - 2*q_Av*T)/(T^2);
a3 = (2*q_A + q_Av*T - 2*q_B + q_Bv*T)/(T^3);

% Second segment
b0 = q_B;
b1 = q_Bv; 
b2 = (3*(q_C - q_B) - q_Cv*T - 2*q_Bv*T)/(T^2);
b3 = (2*q_B + q_Bv*T - 2*q_C + q_Cv*T)/(T^3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 0:0.01:T;
plotSeg1Theta = zeros(3, length(t));
plotSeg1DTheta = zeros(3, length(t));
plotSeg1DDTheta = zeros(3, length(t));

for i = 1:length(t)
    plotSeg1Theta(:,i) = (a0 + a1*t(i) + a2*t(i)^2 + a3*t(i)^3)';
    plotSeg1DTheta(:,i) = (a1 + 2*a2*t(i) + 3*a3*t(i)^2)';
    plotSeg1DDTheta(:,i) = (2*a2 + 6*a3*t(i))';
end

t = 0:0.01:T;
plotSeg2Theta = zeros(3, length(t));
plotSeg2DTheta = zeros(3, length(t));
plotSeg2DDTheta = zeros(3, length(t));

for i = 1:length(t)
    plotSeg2Theta(:,i) = (b0 + b1*t(i) + b2*t(i)^2 + b3*t(i)^3).';
    plotSeg2DTheta(:,i) = (b1 + 2*b2*t(i) + 3*b3*t(i)^2).';
    plotSeg2DDTheta(:,i) = (2*b2 + 6*b3*t(i)).';
end

% Concatonate
t_plot = 0:0.01:(T+T);
plotTheta = zeros(3, length(t_plot));
plotDTheta = zeros(3, length(t_plot));
plotDDTheta = zeros(3, length(t_plot));

plotTheta(1:3, 1:1001) = plotSeg1Theta;
plotTheta(1:3, 1001:2001) = plotSeg2Theta;

plotDTheta(1:3, 1:1001) = plotSeg1DTheta;
plotDTheta(1:3, 1001:2001) = plotSeg2DTheta;

plotDDTheta(1:3, 1:1001) = plotSeg1DDTheta;
plotDDTheta(1:3, 1001:2001) = plotSeg2DDTheta;

figure
hold on
title('Joint Position vs Time')
plot(t_plot, plotTheta(1, :));
plot(t_plot, plotTheta(2, :));
plot(t_plot, plotTheta(3, :));
legend('theta1','theta2','theta3')
xlabel('time (t)') 
ylabel('Joint Angular Position (deg)') 
hold off
grid on

figure
title('Joint Velocity vs Time')
hold on
plot(t_plot, plotDTheta(1, :));
plot(t_plot, plotDTheta(2, :));
plot(t_plot, plotDTheta(3, :));
legend('Dtheta1','Dtheta2','Dtheta3')
ylabel('Joint Angular Velocity (deg/s)') 
hold off
grid on

figure
title('Joint Acceleration vs Time')
hold on
plot(t_plot, plotDDTheta(1, :));
plot(t_plot, plotDDTheta(2, :));
plot(t_plot, plotDDTheta(3, :));
legend('DDtheta1','DDtheta2','DDtheta3')
ylabel('Joint Angular Acceleration (deg/s^2)') 
hold off
grid on
