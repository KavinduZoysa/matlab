syms s
t = [0:0.02:10];
A = [0 1 ; -3 -4];
x0 = [1 ;3];
I = [1 0 ; 0 1]; 

Inv = inv(s * I - A);
vPa = vpa(ilaplace(Inv)); 
Xt = vPa * x0;

Xt_diff = diff(Xt);  % Get the derivation

x1 = subs(Xt(1,1),t); % Substitute 't'
x2 = subs(Xt(2,1),t);
y1 = subs(Xt_diff(1,1),t);
y2 = subs(Xt_diff(2,1),t);

subplot(2,2,1); plot(x1, y1, 'g'); ylabel('X1_diff');xlabel('X1');
subplot(2,2,2); plot(x2, y2, 'b'); ylabel('X2_diff');xlabel('X2');

