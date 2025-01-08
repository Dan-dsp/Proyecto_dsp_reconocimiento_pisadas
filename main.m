% Limpieza del espacio de trabajo y cierre de figuras
clearvars;
close all;
clc;

% Carga de datos
load('People.mat');

% Parámetros
training_ratio = 0.7;
num_people = 3;
num_sensors = 5;
speed_scale = 7;
amplification = 1;
fs = 25600;

% Extracción de características y etiquetas
[features, labels] = extract_features(people, training_ratio, num_people, num_sensors, speed_scale, amplification, fs);

% Realizar el clustering con K-Means
num_clusters = num_people; % Número de clusters (igual al número de personas)
[idx, C] = kmeans(features, num_clusters);

% Añadir los índices de los clusters como características adicionales
features = [features, idx];

% Guardar el modelo K-Means
save('trained_kmeans_model.mat', 'C', 'num_clusters');
disp('El modelo K-Means entrenado ha sido guardado en trained_kmeans_model.mat');

% Visualizar los resultados del clustering
figure;
gscatter(features(:,1), features(:,2), idx, 'rbg', 'o', 5); % Ajuste colores según num_clusters
hold on;
plot(C(:,1), C(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3); % Centroides
title('Clustering de Personas utilizando K-Means');
xlabel('Primera Característica');
ylabel('Segunda Característica');
cluster_legend = arrayfun(@(x) sprintf('Cluster %d', x), 1:num_clusters, 'UniformOutput', false);
legend([cluster_legend, {'Centroides'}]); % Asegúrate de que sea una única entrada de celda
hold off;

% Mostrar distribución de los clusters
disp('Distribución de personas en clusters:');
tabulate(idx);

% Dividir los datos en conjuntos de entrenamiento y prueba
[train_features, train_labels, test_features, test_labels] = dividir_datos(features, labels, training_ratio);

% Parámetro K para KNN
k = 3;

% Llamar al modelo de distancia de Mahalanobis y obtener la precisión
accuracy_mahalanobis = mahalanobis_model(train_features, train_labels, test_features, test_labels);
disp(['Precisión del modelo de Mahalanobis: ', num2str(accuracy_mahalanobis * 100), '%']);

% Llamar al modelo KNN y obtener la precisión
accuracy_knn = knn_model(train_features, train_labels, test_features, test_labels, k);
disp(['Precisión del modelo KNN: ', num2str(accuracy_knn * 100), '%']);

% Llamar al modelo Euclidiano y obtener la precisión
accuracy_euclidean = euclidean_model(train_features, train_labels, test_features, test_labels);
disp(['Precisión del modelo Euclidiano: ', num2str(accuracy_euclidean * 100), '%']);

























