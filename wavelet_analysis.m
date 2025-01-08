
signal = the_data_set_read(1, 1);

fs = 1000;
time = (0:length(signal)-1) / fs; % Vector de tiempo en segundos
figure;
plot(time, signal);
title('title');
xlabel('x');
ylabel('y');
grid on;



signal = the_data_set_read(1, 2);

fs = 1000;
time = (0:length(signal)-1) / fs; % Vector de tiempo en segundos
figure;
plot(time, signal);
title('title');
xlabel('x');
ylabel('y');
grid on;



















% function wavelet_analysis(signal, fs, min_frequency_limit, max_frequency_limit)
% 
%     % Spectrogram Parameters
%     window_size = 256;       % Window size (adjust as needed)
%     overlap = round(0.8 * window_size); % 80% overlap
%     nfft = 1024;             % Number of FFT points
% 
%     % Spectrogram
%     figure;
%     spectrogram(signal, window_size, overlap, nfft, fs, 'yaxis');
%     title('Spectrogram of the Signal');
%     xlabel('Time (s)');
%     ylabel('Frequency (Hz)');
%     colorbar;
% 
%     % Wavelet Transform
%     figure;
%     cwt(signal, 'amor', fs); % 'amor' uses Morlet wavelet, adjust as needed
%     title('Magnitude Scalogram of the Signal');
%     colorbar;
% 
%     % Wavelet analysis
%     fb = cwtfilterbank('SignalLength', length(signal), 'SamplingFrequency', fs, ...
%                        'FrequencyLimits', [min_frequency_limit max_frequency_limit]); % Focus on 20-90 Hz
% 
%     % Compute the scalogram
%     [cfs, frequencies] = wt(fb, signal);
% 
%     % Plot the magnitude scalogram
%     figure;
%     t = (0:length(signal)-1) / fs; % Time vector
%     imagesc(t, frequencies, abs(cfs)); % Magnitude of coefficients
%     axis xy;
%     title('Magnitude Scalogram of the Signal');
%     xlabel('Time (s)');
%     ylabel('Frequency (Hz)');
%     colorbar;
% 
% end

