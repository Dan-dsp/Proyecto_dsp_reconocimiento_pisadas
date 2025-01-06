function smoothed_data = averaging_filter(data)
    % Inputs:
    %   data - Input signal (vector)
    % Output:
    %   smoothed_data - Filtered signal
    
    % Define the window size
    window_size = 5;
    
    % Create averaging filter coefficients
    h = ones(1, window_size) / window_size;
    
    % Apply zero-phase filtering to eliminate phase shift
    smoothed_data = filtfilt(h, 1, data);
end

