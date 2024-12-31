function filtered_data = antialiasing_filter_1(raw_data, fs, fc)
    % ANTIALIASING_FILTER - Low-pass filter for antialiasing
    % 
    % Inputs:
    %   raw_data - Input signal (vector)
    %   fs       - Sampling frequency (Hz)
    %   fc       - Cutoff frequency (Hz, must be less than fs/2)
    %
    % Output:
    %   filtered_data - Filtered signal
    
    % Validate cutoff frequency
    if fc >= fs/2
        error('Cutoff frequency must be less than Nyquist frequency (fs/2).');
    end
    
    % Normalize cutoff frequency to Nyquist
    Wn = fc / (fs / 2);
    
    % Design a Butterworth filter (2nd order for smooth response)
    [b, a] = butter(2, Wn, 'low');
    
    % Apply the filter using zero-phase filtering
    filtered_data = filtfilt(b, a, raw_data);
    
    % Plot frequency response of the filter (optional)
    figure;
    freqz(b, a, 1024, fs);
    title('Frequency Response of Antialiasing Filter');
end

% Parameters
fs = 1000;  % Sampling frequency (Hz)
fc = 200;   % Cutoff frequency (Hz)
t = 0:1/fs:1-1/fs;  % Time vector for 1 second of data

% Example raw data: Mix of low and high-frequency signals
raw_data = sin(2*pi*50*t) + 0.5*sin(2*pi*300*t);
fc
% Call the antialiasing filter function
filtered_data = antialiasing_filter_1(raw_data, fs, fc);

% Plot results
figure;
subplot(2, 1, 1);
plot(t, raw_data);
title('Raw Data');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, filtered_data);
title('Filtered Data (Antialiasing Applied)');
xlabel('Time (s)');
ylabel('Amplitude');


