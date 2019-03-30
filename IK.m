l2 = 3;
l3 = 3;

x = 1;
y = 3;
z = 2.5;

p = sqrt(x^2 + y^2 + z^2);
r = sqrt(x^2 + y^2);

theta1 = atan(y/x);

beta = acos((l2^2+l3^2-p^2)/(2*l2*l3));

theta3 = pi - beta;

theta4 = acos((p^2 + l2^2 - l3^2) / (2*p*l2));

theta5 = atan(z/r);

theta2 = theta5 - theta4;