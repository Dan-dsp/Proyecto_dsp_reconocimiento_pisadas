

% Variables iniciales
training_ratio = 0.6; % Porcentaje de datos usados para entrenamiento
k = 4; % Número de vecinos
distancia = 'euclidean'; % Distancia para KNN

% Definición de datos
num_people = size(people, 1); % Asume que `people` tiene las filas representando individuos.
num_samples_per_person = size(people, 2); % Número de muestras por persona

% Número total de sensores
num_features = num_sensors;

% Dividir datos en entrenamiento y validación
N_train = round(training_ratio * num_samples_per_person); % Muestras de entrenamiento
N_val = num_samples_per_person - N_train; % Muestras de validación

% Preparar datos de entrenamiento
X_train = [];
C_train = [];
for i = 1:num_people
    X_train = [X_train, people(i, 1:N_train, :)]; % Agrega las características de entrenamiento
    C_train = [C_train, i * ones(1, N_train)]; % Etiquetas de clase
end

% Convertir datos en matriz para usar en KNN
X_train = reshape(X_train, num_features, []);
C_train = C_train';

% Crear modelo de KNN
mdl = fitcknn(X_train', C_train, 'NumNeighbors', k, 'Distance', distancia);

% Preparar datos de validación
X_val = [];
C_val = [];
for i = 1:num_people
    X_val = [X_val, people(i, N_train+1:end, :)]; % Agrega las características de validación
    C_val = [C_val, i * ones(1, N_val)];
end

X_val = reshape(X_val, num_features, []);
C_val = C_val';

% Clasificar datos de validación
predictions = mdl.predict(X_val');

% Visualización
figure;
gscatter(X_train(1, :), X_train(2, :), C_train, 'rbg', 'o');
hold on;
gscatter(X_val(1, :), X_val(2, :), predictions, 'rbg', '*');
xlabel('Característica 1');
ylabel('Característica 2');
title(sprintf('KNN con k=%d y distancia=%s', k, distancia));
legend('Train Clase 1', 'Train Clase 2', 'Train Clase 3', ...
       'Val Clase 1', 'Val Clase 2', 'Val Clase 3');
grid on;

% Matriz de confusión
figure;
confusionchart(C_val, predictions);
title('Matriz de confusión para KNN');