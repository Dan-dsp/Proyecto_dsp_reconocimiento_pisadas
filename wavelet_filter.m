function filtered_signal = wavelet_filter(signal,fs)
    %WAVELET_FILTER Summary of this function goes here
    %   Detailed explanation goes here
    % wavelet_analysis(signal, fs, 20, 90);
    No = 5;
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
    filtered_signal = icwt(WT_filtered, [], F, [20 90], 'SignalMean', mean(signal));
end

% 
% % Parámetros de la señal
% fs = 1000;
% signal = read_footstep_trace_data(1,1,1,1,1);
% 
% % Descomponer con DWT
% waveletType = 'sym8';    % Puedes probar 'db8', 'coif5', etc.
% nLevels = 6;             % Número de niveles de descomposición
% 
% % wcoeffs  = vector de coeficientes concatenados
% % L        = array con los tamaños de los coeficientes en cada nivel
% [wcoeffs, L] = wavedec(signal, nLevels, waveletType);
% 
% % Umbral (similar a tu "0.1 * max(abs(WT(:)))")
% % Aquí definimos un umbral como 10% del coeficiente máximo
% globalThreshold = 0.05 * max(abs(wcoeffs));
% 
% % Aplica umbral "hard" o "soft". Ejemplo:
% wcoeffs_thr = wthresh(wcoeffs, 's', globalThreshold);
% % 's' => soft threshold
% % 'h' => hard threshold
% 
% % Reconstruir la señal a partir de los coeficientes umbralizados
% denoised_signal = waverec(wcoeffs_thr, L, waveletType);
% 
% % Graficar
% figure
% subplot(2,1,1)
% plot(t, signal), title('Señal original con ruido')
% subplot(2,1,2)
% plot(t, denoised_signal), title('Señal denoised con umbral global')
% 
% 
% [data_frequency_response, data_y_bins] = frequency_domain(signal, fs);
% [filtered_data_frequency_response, filtered_data_y_bins] = frequency_domain(denoised_signal, fs);
% 
% data_inspector('frequency', data_frequency_response, filtered_data_frequency_response, data_y_bins);
% 
% % % Ejemplo usando wdenoise (Wavelet Toolbox)
% % fs = 1000;
% % signal = read_footstep_trace_data(1,1,1,1,1);
% % 
% % % Filtra linealmente en [20-90] Hz con un paso-banda de orden moderado
% % f1 = 20; f2 = 90;
% % [b,a] = butter(4, [f1, f2]/(fs/2), 'bandpass');
% % bp_signal = filtfilt(b,a, signal);  % zero-phase
% % 
% % % Denosing wavelet (automático)
% % % Por defecto usa 'db1', pero puedes elegir 'sym8', etc.
% % clean_signal = wdenoise(bp_signal, 6, ...
% %                         'Wavelet','sym8', ...
% %                         'DenoisingMethod','SURE', ...
% %                         'ThresholdRule','Soft');
% % 
% % % Visualizar
% % t = (0:length(signal)-1)/fs;
% % subplot(3,1,1), plot(t, signal), title('Original')
% % subplot(3,1,2), plot(t, bp_signal), title('Bandpass 20-90 Hz')
% % subplot(3,1,3), plot(t, clean_signal), title('Bandpass + Wavelet Denoise')
% % 
% % [data_frequency_response, data_y_bins] = frequency_domain(signal, fs);
% % [filtered_data_frequency_response, filtered_data_y_bins] = frequency_domain(clean_signal, fs);
% % 
% % data_inspector('frequency', data_frequency_response, filtered_data_frequency_response, data_y_bins);