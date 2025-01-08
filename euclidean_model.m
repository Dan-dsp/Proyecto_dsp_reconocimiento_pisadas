function accuracy = euclidean_model(train_features, train_labels, test_features, test_labels)
    % Calcular medias por clase
    unique_labels = unique(train_labels);
    num_classes = length(unique_labels);
    means = zeros(num_classes, size(train_features, 2));
    
    for i = 1:num_classes
        class_data = train_features(train_labels == unique_labels(i), :);
        means(i, :) = mean(class_data);
    end

    % Guardar el modelo Euclidiano
    save('trained_euclidean_model.mat', 'means', 'unique_labels');
    disp('El modelo Euclidiano entrenado ha sido guardado en trained_euclidean_model.mat');
    
    % Realizar predicciones en el conjunto de prueba
    predicted_labels = zeros(size(test_labels));
    for j = 1:length(test_labels)
        distances = zeros(num_classes, 1);
        for i = 1:num_classes
            X = test_features(j, :)';
            mean_vector = means(i, :)';
            distances(i) = sqrt(sum((X - mean_vector).^2));
        end
        [~, min_index] = min(distances);
        predicted_labels(j) = unique_labels(min_index);
    end
    
    % Evaluar el modelo
    accuracy = sum(predicted_labels == test_labels) / length(test_labels);
end
