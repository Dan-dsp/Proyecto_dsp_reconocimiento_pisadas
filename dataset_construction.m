load People

% Parameters
sensor_num = 1;
speed_scale = 1;
amplification = 1;
max_traces = 10; % Maximum number of traces to check
person_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; % List of person IDs to process

% Initialize an empty cell array for the new data
new_new_data_set = cell(max_traces, numel(person_ids));

% Loop through each person ID
for col = 1:numel(person_ids)
    person_id = person_ids(col); % Current person ID

    % Loop through all traces up to the maximum
    for trace_num = 1:max_traces
        try
            % Access the data for the current person, trace, and amplification
            current_data = people{person_id}.Sen{sensor_num}.S{speed_scale}{trace_num, amplification};

            % Use the processing_stage_no_plot function to manipulate the signals
            % before saving them
            filtered_data = processing_stage_no_plot(current_data);

            % Add the data to the corresponding cell in the array
            new_new_data_set{trace_num, col} = filtered_data;
        catch
            % Stop if an error occurs (e.g., trace number out of bounds)
            disp(['Error or no data found for person ', num2str(person_id), ...
                  ', trace ', num2str(trace_num)]);
            break;
        end
    end
end

% Save the array to a specific folder path
folderPath = 'C:\Users\Daniel\OneDrive - correounivalle.edu.co\Univalle\09_Noveno_semestre\DSP\Proyecto_2\data_set'; % Replace with your desired folder path
fileName = 'new_new_data_set.mat';    % Desired file name
fullFilePath = fullfile(folderPath, fileName); % Combine folder path and file name

% Save the data
save(fullFilePath, 'new_new_data_set');

% Display the resulting cell array
disp(new_new_data_set);




