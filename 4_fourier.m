% function [outputArg1,outputArg2] = fourier(inputArg1,inputArg2)
% %FOURIER Summary of this function goes here
% %   Detailed explanation goes here
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
% end
% 

% function [outputArg1,outputArg2] = fourier(inputArg1,inputArg2)
% %FOURIER Summary of this function goes here
% %   Detailed explanation goes here
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
% end

% Parameters
fs = 1000;             % Sampling frequency (Hz)
t = 0:1/fs:1-1/fs;     % Time vector (1 second duration)
signal = sin(2*pi*50*t) + 0.5*sin(2*pi*200*t);  % Example signal: 50Hz + 200Hz components

% Compute the Fourier Transform
N = length(signal);               % Length of the signal
fft_signal = fft(signal);         % Compute FFT
P2 = abs(fft_signal / N);         % Two-sided spectrum
P1 = P2(1:N/2+1);                 % Single-sided spectrum
P1(2:end-1) = 2*P1(2:end-1);      % Scale for single-sided

% Frequency axis
f = fs * (0:(N/2)) / N;           % Frequency bins

% Plot the signal
figure;
plot(t, signal);
title('Frequency Domain of the Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;

% Plot the frequency domain
figure;
plot(f, P1);
title('Frequency Domain of the Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;
