function filtered_signal = DWT_filter(signal, fs)
    % % Señal cruda con ruido
    % fs = 1000; % Frecuencia de muestreo
    % signal = read_footstep_trace_data(1, 1, 1, 1, 1); % Señal con ruido
    % t = (0:length(signal)-1) / fs; % Vector de tiempo en segundos
    
    % signal = antialiasing_filter(signal, fs, 90);
    % signal = high_pass_filter(signal, fs, 20);
    
    % ============================
    % Double Density Dual Tree DWT (DD-DT-DWT)
    % ============================
    
    % Tipo de wavelet y niveles de descomposición
    waveletType = 'sym8';    % Wavelet simétrica 8
    nLevels = 6;             % Número de niveles de descomposición
    
    % Descomposición con DD-DT-DWT
    % wcoeffs  = vector de coeficientes concatenados
    % L        = array con los tamaños de los coeficientes en cada nivel
    [wcoeffs, L] = wavedec(signal, nLevels, waveletType);
    
    % Umbralización de coeficientes (para reducir el ruido)
    % Definimos un umbral como un porcentaje del coeficiente máximo
    threshold = 0.1 * max(abs(wcoeffs));
    
    % Aplicamos umbral "soft" a los coeficientes
    wcoeffs_thr = wthresh(wcoeffs, 's', threshold);
    
    % Reconstrucción de la señal utilizando los coeficientes umbralizados
    filtered_signal = waverec(wcoeffs_thr, L, waveletType);
    
    % Escalar señales manteniendo la relación de amplitud
    max_signal = max(abs(signal));
    % max_filtered = max(abs(filtered_signal));
    signal = signal / max_signal;
    % filtered_signal = filtered_signal / max_filtered;
    
    % ============================
    % Gráficos de las señales
    % ============================
    
    % [data_frequency_response, data_y_bins] = frequency_domain(signal, fs);
    % [filtered_data_frequency_response, ~] = frequency_domain(filtered_signal, fs);
    % 
    % data_inspector('frequency', data_frequency_response, filtered_data_frequency_response, data_y_bins);
    
    % figure;
    % subplot(2, 1, 1);
    % plot(t, signal);
    % title('Señal Cruda con Ruido');
    % xlabel('Tiempo (s)');
    % ylabel('Amplitud');
    % 
    % subplot(2, 1, 2);
    % plot(t, filtered_signal);
    % title('Señal Filtrada con DD-DT-DWT');
    % xlabel('Tiempo (s)');
    % ylabel('Amplitud');
end

