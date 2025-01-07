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
% % 
% % signal = read_footstep_trace_data(1,1,1,1,1);
% % fs = 1000;
% % 
% % No = 5;
% % Nv = 32;
% % 
% % % Apply Continuous Wavelet Transform
% % % Step 1: Perform the CWT
% % [WT, F] = cwt(signal, fs, 'NumOctaves', No, 'VoicesPerOctave', Nv); 
% % 
% % % Rango de interés
% % target_idx = (F >= 20 & F <= 90);
% % 
% % % Promedio de los coeficientes en el rango
% % mean_coeffs = mean(abs(WT(target_idx, :)), 2);
% % 
% % % Graficar para inspeccionar
% % plot(F(target_idx), mean_coeffs);
% % title('Amplitud Promedio de los Coeficientes');
% % xlabel('Frecuencia (Hz)');
% % ylabel('Amplitud');
% % 
% % 
% % % signal = read_footstep_trace_data(1, 1, 1, 1, 1);
% % % data = read_footstep_trace_data(1, 1, 1, 1, 1);
% % % signal = processing_stage_no_plot(data);
% % % fs = 1000;
% % 
% % % subplot(2,1,1)
% % % plot(signal)
% % % grid on
% % % title("Original Data")
% % % ylabel("Amplitude")
% % % axis tight
% % % 
% % % subplot(2,1,2)
% % % plot(filtered_signal)
% % % grid on
% % % title("Bandpass Filtered Reconstruction [20 90] Hz");
% % % xlabel("Time (s)")
% % % ylabel("Amplitude")
% % % axis tight
% % 
% % 
% 
% 
% signal = read_footstep_trace_data(1, 1, 1, 1, 1); % Leer señal
% fs = 1000; % Frecuencia de muestreo
% 
% No = 5; % Número de octavas
% Nv = 32; % Voces por octava
% 
% % Transformada Wavelet Continua
% [WT, F] = cwt(signal, fs, 'NumOctaves', No, 'VoicesPerOctave', Nv); 
% 
% % Rango de interés
% target_idx = (F >= 20 & F <= 90);
% 
% % Promedio de los coeficientes en el rango
% mean_coeffs = mean(abs(WT(target_idx, :)), 2);
% 
% % Factor de compensación
% max_coeff = max(mean_coeffs); % Máxima amplitud en el rango
% compensation_factors = max_coeff ./ mean_coeffs;
% 
% % Aplicar factor de compensación
% WT(target_idx, :) = WT(target_idx, :) .* compensation_factors;
% 
% % Reconstruir la señal
% filtered_signal = icwt(WT, [], F, [20 90], 'SignalMean', mean(signal));
% 
% % Graficar resultados
% t = (0:length(signal)-1) / fs;
% figure;
% subplot(2, 1, 1);
% plot(t, signal);
% title('Señal Original');
% xlabel('Tiempo (s)');
% ylabel('Amplitud');
% 
% subplot(2, 1, 2);
% plot(t, filtered_signal);
% title('Señal Reconstruida con Amplitud Uniforme (20–90 Hz)');
% xlabel('Tiempo (s)');
% ylabel('Amplitud');
% 
% [data, ~] = frequency_domain(signal, fs);
% [filtered_data, filtered_data_y_bins] = frequency_domain(filtered_signal, fs);
% 
% data_inspector('frequency', data, filtered_data,filtered_data_y_bins);
