%Calculate frequency
fsamp = 3200/(2*pi);

f1 = 200/(2*pi);
f2 = 500/(2*pi);
f3 = 1000/(2*pi);
f4 = 1200/(2*pi);

fcuts = [f1 f2 f3 f4];
mags = [0 1 0];
devs = [0.0045 0.016 0.0045];

% Get the filter
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);
[hh, ff] = fir1(n,Wn,ftype,kaiser(n+1,beta),'scale');

% Plot the resullts
figure;
impz(hh);

figure;
[H, f] = freqz(hh,1,1024,fsamp);
plot(f,10 * log(abs(H)), 'R');
xlabel('Frequency (Hz)')
ylabel('Magnitude Response (dB)')
title('Magnitude Response');
grid on
figure;

plot(f,10 * log(abs(H)), 'G')
xlim([f2 f3])
xlabel('Frequency (Hz)')
ylabel('Magnitude Response (dB)')
title('Magnitude Response of Pass Band');
grid on