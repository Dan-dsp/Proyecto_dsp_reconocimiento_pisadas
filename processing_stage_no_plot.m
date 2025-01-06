function antialiased_and_averaged_data = processing_stage_no_plot(data)
    % Parameters
    % fs = 25600; % Sampling frequency (Hz)
    % Page 6, third paragraph of section 4
    fs = 1000; % Sampling frequency (Hz)
    fc = 100; % Cutoff frequency (Hz)
    % time = 0 : 1/fs : (1/fs) * (length(data) - 1); % Time vector for 1 second of data
    
    % FILTRADO ANTIALIASING
    antialiased_data = antialiasing_filter(data, fs, fc);
    % FILTRADO AVERAGING
    antialiased_and_averaged_data = averaging_filter(antialiased_data);
    % FILTRADO WAVELET
    
end

