function filtered_data = processing_stage_no_plot(data)
    % Parameters
    % fs = 25600; % Sampling frequency (Hz)
    % Page 6, third paragraph of section 4
    fs = 1000; % Sampling frequency (Hz)
    fc = 90; % Cutoff frequency (Hz)
    % time = 0 : 1/fs : (1/fs) * (length(data) - 1); % Time vector for 1 second of data
    
    % FILTRADO ANTIALIASING
    filtered_data = antialiasing_filter(data, fs, fc);
    % FILTRADO PASO ALTO
    filtered_data = high_pass_filter(filtered_data, fs, fc_h);
    % FILTRADO AVERAGING
    % filtered_data = averaging_filter(filtered_data);
    % FILTRADO WAVELET
    filtered_data = wavelet_filter(filtered_data, fs);
    % FILTRADO DWT
    % filtered_data = DWT_filter(filtered_data, fs);
end

