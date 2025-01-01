% OBTENCIÓN DE LA SEÑAL
% read_footstep_trace_data(person_id = 1, sensor_number = 1, speed_scale = 7, amplification = 1, trace_number = 1)
data = read_footstep_trace_data(1, 1, 7, 1, 1);

% Parameters
% fs = 25600; % Sampling frequency (Hz)
fs = 10000; % Sampling frequency (Hz)
fc = 200; % Cutoff frequency (Hz)
time = 0 : 1/fs : (1/fs) * (length(data) - 1); % Time vector for 1 second of data

% Call the antialiasing filter function
filtered_data = antialiasing_filter(data, fs, fc);

% Plot the two signals in data inspector
data_inspector(data, filtered_data, fs);


% % Plots the frequency's domain plot of the data signal
% frequency_domain(data, fs)
% % Plots the frequency's domain plot of the filtered data signal
% frequency_domain(filtered_data, fs)
% 
% % Plot results
% figure;
% subplot(2, 1, 1);
% plot(time, data);
% title('Raw Data');
% xlabel('Time (s)');
% ylabel('Amplitude');
% 
% subplot(2, 1, 2);
% plot(time, filtered_data);
% title('Filtered Data (Antialiasing Applied)');
% xlabel('Time (s)');
% ylabel('Amplitude');



