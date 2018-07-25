A = [0 1; -2 -3];

tspan = [0, 20];
y0 = [2; 0];
unitstep = zeros(size(tspan)); 
unitstep(tspan>=1) = 1; 
% ode = @(t,y) A*[y(1); y(2)];
ode = @(t,y) A*[y(1); y(2)] + [0; 1]*1;
[t,y] = ode45(ode, tspan, y0);

% Plot of the solution
subplot(2,1,1); plot(t,y(:,1))
xlabel('t')
ylabel('solution y(1)')

subplot(2,1,2); plot(t,y(:,2))
xlabel('t')
ylabel('solution y(2)')