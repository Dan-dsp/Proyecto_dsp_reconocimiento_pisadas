% function filtered_data = wavelet_filter(inputArg1,inputArg2)
% %WAVELET_FILTER Summary of this function goes here
% %   Detailed explanation goes here
% 
% end

signal = read_footstep_trace_data(1, 1, 1, 1, 1);
fs = 1000;

% % Spectrogram Parameters
% window_size = 256;       % Window size (adjust as needed)
% overlap = round(0.8 * window_size); % 80% overlap
% nfft = 1024;             % Number of FFT points
% 
% % Spectrogram
% figure;
% spectrogram(signal, window_size, overlap, nfft, fs, 'yaxis');
% title('Spectrogram of the Signal');
% xlabel('Time (s)');
% ylabel('Frequency (Hz)');
% colorbar;

% Wavelet Transform
figure;
cwt(signal, 'amor', fs); % 'amor' uses Morlet wavelet, adjust as needed
title('Magnitude Scalogram of the Signal');
colorbar;

% % Wavelet analysis
% fb = cwtfilterbank('SignalLength', length(signal), 'SamplingFrequency', fs, ...
%                    'FrequencyLimits', [20 90]); % Focus on 20-90 Hz
% 
% % Compute the scalogram
% [cfs, frequencies] = wt(fb, signal);
% 
% % Plot the magnitude scalogram
% figure;
% t = (0:length(signal)-1) / fs; % Time vector
% imagesc(t, frequencies, abs(cfs)); % Magnitude of coefficients
% axis xy;
% title('Magnitude Scalogram of the Signal');
% xlabel('Time (s)');
% ylabel('Frequency (Hz)');
% colorbar;

