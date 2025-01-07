% OBTENCIÓN DE LA SEÑAL
% read_footstep_trace_data(person_id = 1, sensor_number = 1, speed_scale = 7, amplification = 1, trace_number = 1)
data = read_footstep_trace_data(1, 1, 1, 1, 1);

% Parameters
% fs = 25600; % Sampling frequency (Hz)
% Page 6, third paragraph of section 4
fs = 1000; % Sampling frequency (Hz)
fc_h = 20; % Cutoff frequency (Hz)
fc_l = 90; % Cutoff frequency (Hz)
% time = 0 : 1/fs : (1/fs) * (length(data) - 1); % Time vector for 1 second of data

% FILTRADO ANTIALIASING
filtered_data = antialiasing_filter(data, fs, fc_l);
% FILTRADO AVERAGING
filtered_data = high_pass_filter(filtered_data, fs, fc_h);
% FILTRADO WAVELET
% filtered_data = wavelet_filter(filtered_data, fs);
% FILTRADO DWT


% OBTENCIÓN DE LA RESPUESTA EN FRECUENCIA DE LA SEÑAL Y LA SEÑAL FILTRADA
[data_frequency_response, data_y_bins] = frequency_domain(data, fs);
[filtered_data_frequency_response, filtered_data_y_bins] = frequency_domain(filtered_data, fs);

% GRAFICAR EN EL DATA INSPECTOR LA SEÑAL Y LA SEÑAL FILTRADA EN EL DOMINIO
% DEL TIEMPO
data_inspector('time', data, filtered_data, fs);

% GRAFICAR EN EL DATA INSPECTOR LA SEÑAL Y LA SEÑAL FILTRADA EN EL DOMINIO
% DE LA FRECUENCIA
data_inspector('frequency', data_frequency_response, filtered_data_frequency_response, data_y_bins);
