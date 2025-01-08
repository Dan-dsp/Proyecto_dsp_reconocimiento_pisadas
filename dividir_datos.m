function [train_features, train_labels, test_features, test_labels] = dividir_datos(features, labels, training_ratio)
    % Inicializar matrices de características y etiquetas para entrenamiento y prueba
    num_samples = size(features, 1);
    indices = randperm(num_samples);
    num_train = round(training_ratio * num_samples);

    % Separar los conjuntos de entrenamiento y prueba
    train_indices = indices(1:num_train);
    test_indices = indices(num_train+1:end);

    train_features = features(train_indices, :);
    test_features = features(test_indices, :);
    train_labels = labels(train_indices);
    test_labels = labels(test_indices);
end