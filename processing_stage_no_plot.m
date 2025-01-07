function filtered_data_dwt = processing_stage_no_plot(data)
    % Parameters
    % Page 6, third paragraph of section 4
    fs = 1000; % Sampling frequency (Hz)
    fc_h = 20; % Cutoff frequency (Hz)
    fc_l = 90;
    % time = 0 : 1/fs : (1/fs) * (length(data) - 1); % Time vector for 1 second of data

    % FILTRADO ANTIALIASING
    filtered_data = antialiasing_filter(data, fs, fc_l);
    % FILTRADO PASO ALTO
    filtered_data = high_pass_filter(filtered_data, fs, fc_h);
    % FILTRADO AVERAGING
    filtered_data = averaging_filter(filtered_data);
    % FILTRADO WAVELET
    % filtered_data_cwt = wavelet_filter(filtered_data, fs);
    % FILTRADO DWT
    filtered_data_dwt = DWT_filter(filtered_data, fs);
end

