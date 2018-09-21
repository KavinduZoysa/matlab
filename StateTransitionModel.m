A = [0 1; -2 -3];

tspan = [0, 20];
y0 = [2; 0];

% Differencial equation when U(t) equals zero
ode1 = @(t,y) A*[y(1); y(2)] + [0; 2]*1;
[t,y] = ode45(ode1, tspan, y0);

% Plot of the solution
subplot(2,2,1); plot(t,y(:,1)); grid on;
xlabel('t')
ylabel('solution y(1) with u')

subplot(2,2,2); plot(t,y(:,2)); grid on;
xlabel('t')
ylabel('solution y(2) with u')

% Differencial equation when U(t) does not equal zero
ode2 = @(t,y) A*[y(1); y(2)];
[t,y] = ode45(ode2, tspan, y0);

% Plot of the solution
subplot(2,2,3); plot(t,y(:,1)); grid on;
xlabel('t')
ylabel('solution y(1) without u')

subplot(2,2,4); plot(t,y(:,2)); grid on;
xlabel('t')
ylabel('solution y(2) without u')