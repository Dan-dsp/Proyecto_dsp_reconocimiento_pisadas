% Parámetros iniciales
fs = 1000; % Frecuencia de muestreo
amplification = 1; % Factor de amplificación
speed_scale = 1; % Velocidad
sensor_number = 1; % Sensor

% Iterar sobre las primeras 3 personas
for person_id = 1:3
    % Inicializar señal acumulativa como un vector vacío
    accumulated_signal = [];
    
    % Sumar trazas del 1 al 10
    for trace_num = 1:10
        % Leer datos
        data = read_footstep_trace_data(person_id, sensor_number, speed_scale, amplification, trace_num);
        
        % Si accumulated_signal está vacío, inicializarlo con la primera señal
        if isempty(accumulated_signal)
            accumulated_signal = data;
        else
            % Sumar punto por punto (asegurarse de que las longitudes coincidan)
            accumulated_signal = accumulated_signal(1:min(length(accumulated_signal), length(data))) + ...
                                 data(1:min(length(accumulated_signal), length(data)));
        end
    end
    
    % Generar espectrograma
    figure;
    spectrogram(accumulated_signal, 256, 128, 256, fs, 'yaxis');
    title(['Spectrogram for Person ', num2str(person_id)]);
    colorbar;
    
    % Generar escalograma
    scalogram(accumulated_signal, fs);
    title(['Scalogram for Person ', num2str(person_id)]);
end