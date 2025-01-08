function [features, labels] = extract_features(people, training_ratio, num_people, num_sensors, speed_scale, amplification, fs)
    % Inicializar matrices de características y etiquetas
    features = [];
    labels = [];
    
    % Loop para cada persona
    for person_id = 1:num_people
        if ~isempty(people{person_id}) && isstruct(people{person_id})
            % Loop para cada sensor
            for sensor_num = 1:num_sensors
                if isfield(people{person_id}, 'Sen') && length(people{person_id}.Sen) >= sensor_num && ...
                        ~isempty(people{person_id}.Sen{sensor_num}) && isstruct(people{person_id}.Sen{sensor_num}) && ...
                        isfield(people{person_id}.Sen{sensor_num}, 'S') && iscell(people{person_id}.Sen{sensor_num}.S)
                    if ~isempty(people{person_id}.Sen{sensor_num}.S{speed_scale})
                        num_traces = size(people{person_id}.Sen{sensor_num}.S{speed_scale}, 1);
                        % Loop para cada trazo
                        for trace_num = 1:num_traces
                            num_amplifications = size(people{person_id}.Sen{sensor_num}.S{speed_scale}, 2);
                            if amplification <= num_amplifications
                                if trace_num <= num_traces && ~isempty(people{person_id}.Sen{sensor_num}.S{speed_scale}{trace_num, amplification})
                                    data = people{person_id}.Sen{sensor_num}.S{speed_scale}{trace_num, amplification};
                                    if isempty(data)
                                        continue;
                                    end

                                    % Aplicar filtros 
                                    data = processing_stage_no_plot(data);
                                    
                                    % Transformar las señales al dominio de la frecuencia usando FFT
                                    fft_data = fft(data);
                                    magnitude_data = abs(fft_data);

                                    % Extraer características de la magnitud
                                    mean_magnitude = mean(magnitude_data);
                                    std_magnitude = std(magnitude_data);
                                    max_magnitude = max(magnitude_data);
                                    min_magnitude = min(magnitude_data);
                                    
                                    % Extraer características en el dominio del tiempo
                                    mean_time = mean(data);
                                    std_time = std(data);
                                    max_time = max(data);
                                    min_time = min(data);
                                    rms_time = rms(data);
                                    kurtosis_time = kurtosis(data);
                                    skewness_time = skewness(data);

                                    % Calcular la energía en diferentes bandas de frecuencia
                                    energy_low = bandpower(data, fs, [0 500]);
                                    energy_mid = bandpower(data, fs, [500 1000]);
                                    energy_high = bandpower(data, fs, [1000 fs/2]);

                                    % Crear vector de características
                                    feature_vector = [mean_magnitude, std_magnitude, max_magnitude, min_magnitude, mean_time, std_time, max_time, min_time, rms_time, kurtosis_time, skewness_time, energy_low, energy_mid, energy_high];

                                    % Normalizar las características
                                    feature_vector = normalize(feature_vector);

                                    % Añadir al conjunto de datos completo
                                    features = [features; feature_vector];
                                    labels = [labels; person_id];
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function norm_features = normalize(features)
    norm_features = (features - mean(features)) ./ std(features);
end

