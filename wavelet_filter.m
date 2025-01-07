% function filtered_signal = wavelet_filter(signal,fs)
%     %WAVELET_FILTER Summary of this function goes here
%     %   Detailed explanation goes here
%     % wavelet_analysis(signal, fs, 20, 90);
%     No = 5;
%     Nv = 32;
% 
%     % Apply Continuous Wavelet Transform
%     % Step 1: Perform the CWT
%     [WT, F] = cwt(signal, fs, 'NumOctaves', No, 'VoicesPerOctave', Nv); 
% 
%     % Define amplitude threshold (experiment with this value)
%     amplitude_threshold = 0.1 * max(abs(WT(:))); % 10% of the max coefficient
% 
%     % Apply thresholding
%     WT_filtered = WT; % Copy original coefficients
%     WT_filtered(abs(WT) < amplitude_threshold) = 0; % Zero out small coefficients
% 
%     % Step 2: Reconstruct the filtered signal in the desired frequency range (20–90 Hz)
%     filtered_signal = icwt(WT_filtered, [], F, [20 90], 'SignalMean', mean(signal));
% end

