function is_known = identify_person_function_knn(data, fs)
    % Verificar si el archivo del modelo KNN entrenado existe
    if exist('trained_knn_model.mat', 'file') == 2
        % Cargar el modelo KNN guardado
        load('trained_knn_model.mat', 'knn_model');
        disp('El modelo KNN entrenado ha sido cargado desde trained_knn_model.mat');
    else
        error('El archivo trained_knn_model.mat no existe. Por favor, entrena y guarda el modelo KNN primero.');
    end
    
    % Verificar si el archivo del modelo K-Means existe
    if exist('trained_kmeans_model.mat', 'file') == 2
        % Cargar el modelo K-Means guardado
        load('trained_kmeans_model.mat', 'C', 'num_clusters');
        disp('El modelo K-Means entrenado ha sido cargado desde trained_kmeans_model.mat');
    else
        error('El archivo trained_kmeans_model.mat no existe. Por favor, entrena y guarda el modelo K-Means primero.');
    end

    % Procesar los datos con processing_stage_no_plot
    filtered_data = processing_stage_no_plot(data);
    
    % Transformar las señales al dominio de la frecuencia usando FFT
    fft_data = fft(filtered_data);
    magnitude_data = abs(fft_data);
    
    % Extraer características
    mean_magnitude = mean(magnitude_data);
    std_magnitude = std(magnitude_data);
    max_magnitude = max(magnitude_data);
    min_magnitude = min(magnitude_data);
    mean_time = mean(filtered_data);
    std_time = std(filtered_data);
    max_time = max(filtered_data);
    min_time = min(filtered_data);
    rms_time = rms(filtered_data);
    kurtosis_time = kurtosis(filtered_data);
    skewness_time = skewness(filtered_data);
    energy_low = bandpower(filtered_data, fs, [0 500]);
    energy_mid = bandpower(filtered_data, fs, [500 1000]);
    energy_high = bandpower(filtered_data, fs, [1000 fs/2]);
    
    % Crear vector de características
    new_sample = [mean_magnitude, std_magnitude, max_magnitude, min_magnitude, mean_time, std_time, max_time, min_time, rms_time, kurtosis_time, skewness_time, energy_low, energy_mid, energy_high];
    
    % Normalizar las características
    new_sample = normalize(new_sample);

    % Asignar el índice del cluster basado en los centroides
    distances_to_centroids = pdist2(new_sample, C);
    [~, cluster_idx] = min(distances_to_centroids);

    % Añadir el índice del cluster a las características
    new_sample = [new_sample, cluster_idx];
    
    % Verificar dimensiones del nuevo sample
    if size(new_sample, 2) ~= 15
        error('El número de características en new_sample no es igual al esperado (15).');
    end
    
    % Predecir la etiqueta de la persona y obtener las distancias
    [predicted_person, scores] = predict(knn_model, new_sample);
    min_distance = min(scores);
    
    % Establecer un umbral para considerar la persona como desconocida
    distance_threshold = 10; % Ajusta este valor según sea necesario
    if min_distance > distance_threshold
        is_known = false;
        disp('La persona no es conocida.');
    else
        % Verificar si la persona es conocida o no
        is_known = ismember(predicted_person, unique(knn_model.Y));

        % Mostrar resultado
        if is_known
            disp(['La nueva muestra fue identificada como la persona ID: ', num2str(predicted_person)]);
        else
            disp('La persona no es conocida.');
        end
    end
end

function norm_features = normalize(features)
    norm_features = (features - mean(features)) ./ std(features);
end


