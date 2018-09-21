% Read the index
index = input('Enter  the last three numbers of your index number:\n');
A = idivide(int32(index), 100, 'floor');
B =  idivide(int32(rem(index, 100)), 10, 'floor');
C = rem(index, 10);

% Specifications in rad/s and dB
Ap = 0.1 + 0.01*double(A);             % Maximum passband ripple
Aa = 40 + B;                                    % Minimum stopband attenuation
wp1 = C*100 + 500;                        % Lower passband edge
wp2 = C*100 + 1000;                      % Upper passband edge
wa1 = C*100 + 200;                        % Lower stopband edge
wa2 = C*100 + 1200;                      % Upper stopband edge

ws = 2*(C*100 + 1600);                  % Sampling frequency
fs = ws/(2*pi);
W = [wp1 wp2 wa1 wa2];

% Convert specifications into rad/sample
W = W*(2*pi/ws);

% Convert the specifications into analog frequency
% W = (ws/pi)*tan(W/2);
W = (2*fs)*tan(W/2);
Wp = [W(1) W(2)];
Ws = [W(3) W(4)];

[n,Wn] = buttord(Wp,Ws,Ap,Aa, 's');
[num,den] = butter(n,Wn, 's');
%Prewraping frequency
fp = (W(1) + W(2)) / (2*2*pi);

[num,den] = bilinear(num,den,fs, fp);  
fvtool(num,den)

[hh, ww] = freqz(num, den, 1024);
figure;
plot(ww/pi,10 * log(abs(hh)))
xlim([W(1) W(2)] / (ws/2))
xlabel('Normalized Frequency')
ylabel('Magnitude Response (dB)')
title('Magnitude Response of Pass Band');
