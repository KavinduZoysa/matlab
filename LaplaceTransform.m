syms t s
Y = 1/((s)*(s + 1)*(s + 2));
U = (s^2 + 3*s + 1)/((s)*(s + 1)*(s + 2));
f = ilaplace(Y);
u = ilaplace(U);
ezplot(f + u, [0 20])