% Señal cruda con ruido
fs = 1000; % Frecuencia de muestreo
signal = read_footstep_trace_data(1, 1, 1, 1, 1); % Señal con ruido
t = (0:length(signal)-1) / fs; % Vector de tiempo en segundos

% Señal filtrada como referencia (e.g., usando Wavelet)
filtered_signal = wavelet_filter(signal, fs);

% Escalar señales manteniendo la relación de amplitud
max_signal = max(abs(signal));
max_filtered = max(abs(filtered_signal));
signal = signal / max_signal;
filtered_signal = filtered_signal / max_filtered;

% Segmentación temporal
segment_length = 5000; % Longitud de cada segmento
num_segments = ceil(length(signal) / segment_length);
output_signal = zeros(size(signal)); % Inicializar señal de salida acumulada
error_signal = zeros(size(signal)); % Inicializar señal de error acumulada

for i = 1:num_segments
    % Definir índices del segmento actual
    start_idx = (i-1) * segment_length + 1;
    end_idx = min(i * segment_length, length(signal));

    % Extraer segmento
    segment_signal = signal(start_idx:end_idx);
    segment_filtered = filtered_signal(start_idx:end_idx);

    % Ajustar dinámicamente mu basado en el error acumulado
    if i == 1
        dynamic_mu = 0.001; % Valor inicial de mu
    else
        recent_error = mean(abs(error_signal(start_idx:end_idx-1))); % Error reciente
        dynamic_mu = max(0.0001, min(0.01, recent_error)); % Limitar mu dentro de un rango seguro
    end

    % Filtro adaptativo LMS
    filter_order = 32; % Orden del filtro aumentado
    adaptive_filter = dsp.LMSFilter('Length', filter_order, 'StepSize', dynamic_mu);

    % Filtrar el segmento
    [segment_output, segment_error] = adaptive_filter(segment_signal(:), segment_filtered(:));

    % Almacenar resultados
    output_signal(start_idx:end_idx) = segment_output;
    error_signal(start_idx:end_idx) = segment_error;
end

[data_frequency_response, data_y_bins] = frequency_domain(output_signal, fs);
[filtered_data_frequency_response, filtered_data_y_bins] = frequency_domain(error_signal, fs);

data_inspector('frequency', data_frequency_response, filtered_data_frequency_response, data_y_bins);

% Graficar resultados
figure;
subplot(4, 1, 1);
plot(t, signal);
title('Señal Cruda con Ruido');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(4, 1, 2);
plot(t, filtered_signal);
title('Señal Filtrada (Referencia)');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(4, 1, 3);
plot(t, output_signal);
title('Señal Final con Ruido Reducido');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(4, 1, 4);
plot(t, error_signal);
title('Error del Filtro Adaptativo');
xlabel('Tiempo (s)');
ylabel('Error');




% % Parámetros iniciales
% fs = 1000; % Frecuencia de muestreo
% amplification = 1; % Factor de amplificación
% speed_scale = 1; % Velocidad
% sensor_number = 1; % Sensor
% 
% % Longitud inicial prealocada
% preallocated_length = 45506;
% 
% % Iterar sobre las primeras 3 personas
% for person_id = 1:3
%     % Inicializar señal acumulativa con ceros
%     accumulated_signal = zeros(1, preallocated_length);
% 
%     % Sumar trazas del 1 al 10
%     for trace_num = 1:10
%         % Leer datos
%         data = read_footstep_trace_data(person_id, sensor_number, speed_scale, amplification, trace_num);
%         current_length = length(data);
% 
%         % Ajustar longitudes para que coincidan
%         if current_length > length(accumulated_signal)
%             % Extender accumulated_signal con ceros si data es más larga
%             accumulated_signal = [accumulated_signal, zeros(1, current_length - length(accumulated_signal))];
%         elseif current_length < length(accumulated_signal)
%             % Extender data con ceros si accumulated_signal es más larga
%             data = [data, zeros(1, length(accumulated_signal) - current_length)];
%         end
% 
%         % Sumar punto por punto
%         accumulated_signal = accumulated_signal + data;
%     end
% 
%     % Generar espectrograma
%     figure;
%     spectrogram(accumulated_signal, 256, 128, 256, fs, 'yaxis');
%     title(['Spectrogram for Person ', num2str(person_id)]);
%     colorbar;
% 
%     % Generar escalograma
%     scalogram(accumulated_signal, fs);
%     title(['Scalogram for Person ', num2str(person_id)]);
% end
