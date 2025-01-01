% data = read_footstep_trace_data(1, 1, 7, 1, 1);
% read_footstep_trace_data(person_id, sensor_number, speed_scale, amplification, trace_number)
data = read_footstep_trace_data(3, 1, 7, 1, 1);

% % Parameters
fs = 25600; % Sampling frequency (Hz)
fc = 200; % Cutoff frequency (Hz)
time = 0 : 1/fs : (1/fs) * (length(data) - 1); % Time vector for 1 second of data

% Call the antialiasing filter function
filtered_data = antialiasing_filter(data, fs, fc);

frequency_domain(data, fs)

% Plot results
figure;
subplot(2, 1, 1);
plot(time, data);
title('Raw Data');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(time, filtered_data);
title('Filtered Data (Antialiasing Applied)');
xlabel('Time (s)');
ylabel('Amplitude');

frequency_domain(filtered_data, fs)
