function accuracy = knn_model(train_features, train_labels, test_features, test_labels, k)
    % Crear y entrenar el modelo KNN
    knn_model = fitcknn(train_features, train_labels, 'NumNeighbors', k);
    
    % Guardar el modelo KNN entrenado
    save('trained_knn_model.mat', 'knn_model');
    disp('El modelo KNN entrenado ha sido guardado en trained_knn_model.mat');
    
    % Realizar predicciones en el conjunto de prueba
    predicted_labels = predict(knn_model, test_features);
    
    % Evaluar el modelo
    accuracy = sum(predicted_labels == test_labels) / length(test_labels);
end



