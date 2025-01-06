function filtered_signal = wavelet_filter(signal,fs)
    %WAVELET_FILTER Summary of this function goes here
    %   Detailed explanation goes here
    % wavelet_analysis(signal, fs, 20, 90);
    No = 10;
    Nv = 32;
    
    % Apply Continuous Wavelet Transform
    % Step 1: Perform the CWT
    [WT, F] = cwt(signal, fs, 'NumOctaves', No, 'VoicesPerOctave', Nv); 
    
    % Define amplitude threshold (experiment with this value)
    amplitude_threshold = 0.1 * max(abs(WT(:))); % 10% of the max coefficient
    
    % Apply thresholding
    WT_filtered = WT; % Copy original coefficients
    WT_filtered(abs(WT) < amplitude_threshold) = 0; % Zero out small coefficients
    
    % Step 2: Reconstruct the filtered signal in the desired frequency range (20–90 Hz)
    filtered_signal = icwt(WT_filtered, [], F, [20 150], 'SignalMean', mean(signal));
end

% signal = read_footstep_trace_data(1, 1, 1, 1, 1);
% data = read_footstep_trace_data(1, 1, 1, 1, 1);
% signal = processing_stage_no_plot(data);
% fs = 1000;

% subplot(2,1,1)
% plot(signal)
% grid on
% title("Original Data")
% ylabel("Amplitude")
% axis tight
% 
% subplot(2,1,2)
% plot(filtered_signal)
% grid on
% title("Bandpass Filtered Reconstruction [20 90] Hz");
% xlabel("Time (s)")
% ylabel("Amplitude")
% axis tight


