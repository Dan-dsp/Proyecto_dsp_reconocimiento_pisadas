% function [outputArg1,outputArg2] = ensayo_filtro_antialiasing(inputArg1,inputArg2)
% %ENSAYO_FILTRO_ANTIALIASING Summary of this function goes here
% %   Detailed explanation goes here
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
% end

% data = read_footstep_trace_data(1, 1, 7, 1, 1);
data = read_footstep_trace_data(1, 1, 7, 1, 1);

% % Parameters
% fs = 1000;  % Sampling frequency (Hz)
% fc = 200;   % Cutoff frequency (Hz)
% t = 0:1/fs:1-1/fs;  % Time vector for 1 second of data

fs = 25600;
fc = 800;
time = 0 : 1/fs : (1/fs) * (length(data) - 1);

% Call the antialiasing filter function
filtered_data = antialiasing_filter(data, fs, fc);

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
