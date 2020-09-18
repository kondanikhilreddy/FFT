Fs = 500;
f = 20;

[y,fs] = audioread('Voice1.mp3');
n=[1:1:length(y)];
% add noise to the signal
% y = x + rand(1,length(x));
% plot the noisy signal
subplot(2,2,1); plot(n,y);
title('Noisy Signal');
xlabel('Time (s)');
ylabel('Amplitude');

%% Spectral analysis of the signal
L = length(y);
NFFT = 2^nextpow2(L);
y_fft = abs(fft(y,NFFT));
% creating frequency axis
freq = Fs/2*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.
subplot(2,2,2);
plot(freq,y_fft(1:NFFT/2+1)); 
title('Single-Sided Amplitude Spectrum of y(t)');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');

%% Design Filter and apply on the sequence
o = 5;
wn = [0 210]*2/Fs;
[b,a] = butter(o,wn,'bandpass');
% see frequency response of the filter
[h,w] = freqz(b,a,1024,Fs);
subplot(2,2,3);
plot(w,20*log10(abs(h)));
title('Magnitude Response of the Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude');grid on;

% Filter the signal
y_filt = filter(b,a,y)*10;
subplot(2,2,4);
plot(n,y_filt);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');
sound(y_filt,fs)