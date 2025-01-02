function smoothed_data = averaging_filter(data, window_size)
    % AVERAGING_FILTER - Simple moving average filter
    % Inputs:
    %   data - Input signal (vector)
    %   window_size - Number of samples for averaging (scalar)
    % Output:
    %   smoothed_data - Filtered signal
    
    % Create averaging filter coefficients
    h = ones(1, window_size) / window_size;
    
    % Apply the filter
    smoothed_data = filter(h, 1, data);
end


