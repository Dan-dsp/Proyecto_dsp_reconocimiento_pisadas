function filtered_data = high_pass_filter(raw_data, fs, fc)
    % ANTIALIASING_FILTER - Low-pass filter for antialiasing
    % Validate cutoff frequency
    if fc >= fs/2
        error('Cutoff frequency must be less than Nyquist frequency (fs/2).');
    end
    % Normalize cutoff frequency to Nyquist
    Wn = fc / (fs / 2);
    
    % Design a Butterworth filter (2nd order for smooth response)
    [b, a] = butter(6, Wn,"high");
    
    % Apply the filter using zero-phase filtering
    filtered_data = filtfilt(b, a, raw_data);
    
    % Plot frequency response of the filter
    % figure;
    % freqz(b, a, 1024, fs);
    % title('Frequency Response of Antialiasing Filter');
end

