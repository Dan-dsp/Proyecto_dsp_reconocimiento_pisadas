% ----------- Ejemplo de uso con la Interfaz Gráfica -----------
% Cargar datos de ejemplo
load('People.mat');
data = people{1}.Sen{1}.S{1}{1, 1};
fs = 25600;

% Llamar a las funciones identify_person_function para cada modelo
is_known_knn = identify_person_function_knn(data, fs);
is_known_mahalanobis = identify_person_function_mahalanobis(data, fs);
is_known_euclidean = identify_person_function_euclidean(data, fs);

% Combinar resultados
is_known = is_known_knn || is_known_mahalanobis || is_known_euclidean;

if is_known
    disp('La persona es conocida.');
else
    disp('La persona no es conocida.');
end
% -----------------------------------------------------------




