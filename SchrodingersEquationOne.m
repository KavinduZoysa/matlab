x = 1:0.01:2;
k = 4;
shi = exp(k*1i*x);
plot(x, real(shi));


subplot(211); plot(x,real(shi));
ylabel('Real part'); grid on; hold on;

subplot(212); plot(x,cos(k*x));
ylabel('Cosine'); grid on; hold on;