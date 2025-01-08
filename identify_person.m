% ----------- Ejemplo de uso con la Interfaz Gráfica -----------
% Cargar datos de ejemplo
load('People.mat');
data = people{6}.Sen{5}.S{7}{1, 1};
fs = 25600;

% Llamar a las funciones identify_person_function para cada modelo
is_known_knn = identify_person_function_knn(data, fs);
is_known_mahalanobis = identify_person_function_mahalanobis(data, fs);

% Combinar resultados
is_known = is_known_knn || is_known_mahalanobis;

if is_known
    disp('La persona es conocida.');
else
    disp('La persona no es conocida.');
end
% -----------------------------------------------------------




