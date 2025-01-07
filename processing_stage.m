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
% FILTRADO PASO ALTO
filtered_data = high_pass_filter(filtered_data, fs, fc_h);
% FILTRADO AVERAGING
filtered_data = averaging_filter(filtered_data);
% FILTRADO WAVELET
filtered_data_cwt = wavelet_filter(filtered_data, fs);
% FILTRADO DWT
filtered_data_dwt = DWT_filter(filtered_data, fs);

% OBTENCIÓN DE LA RESPUESTA EN FRECUENCIA DE LA SEÑAL Y LA SEÑAL FILTRADA
[data_frequency_response, data_y_bins] = frequency_domain(data, fs);
[filtered_data_frequency_response_cwt, filtered_data_y_bins_cwt] = frequency_domain(filtered_data_cwt, fs);
[filtered_data_frequency_response_dwt, filtered_data_y_bins_dwt] = frequency_domain(filtered_data_dwt, fs);

% GRAFICAR EN EL DATA INSPECTOR LA SEÑAL Y LA SEÑAL FILTRADA EN EL DOMINIO
% DEL TIEMPO
data_inspector('time', data, filtered_data_cwt, fs);
data_inspector('time', filtered_data_cwt, filtered_data_dwt, fs);

% GRAFICAR EN EL DATA INSPECTOR LA SEÑAL Y LA SEÑAL FILTRADA EN EL DOMINIO
% DE LA FRECUENCIA
data_inspector('frequency', data_frequency_response, filtered_data_frequency_response_cwt, data_y_bins);
data_inspector('frequency', data_frequency_response, filtered_data_frequency_response_dwt, data_y_bins);
