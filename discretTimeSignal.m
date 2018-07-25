% t = 0:0.01:2;
% x = sin(2*pi*t);
% 
% plot(t,x,t,zeros(size(t)),'k--'), ylim([-1.1 1.1])
% xlabel('t [sec]'); 
% ylabel('x(t)');
% 
% omega1 = pi/4;
% omega2 = 3*pi/8;

N = 20;
n = 0:N-1;
t = 0:0.01:20;

x = cos(omega1*n);
y = cos(omega1*t);
subplot(4,1,1);  plot(t,y,t,zeros(size(t)),'k--'), ylim([-1.1 1.1])
subplot(4,1,2);  stem(n,x), axis tight

x = cos(omega2*n);
y = cos(omega2*t);

subplot(4,1,3);   plot(t,y,t,zeros(size(t)),'k--'), ylim([-1.1 1.1])
subplot(4,1,4);  stem(n,x), axis tight

