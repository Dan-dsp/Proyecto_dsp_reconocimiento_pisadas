function [outputArg1,outputArg2] = dataset_construction(sensor_num, speed_scale, amplification)
    load People
    
    % Parameters
    % sensor_num = 1;
    % speed_scale = 1;
    % amplification = 1;
    max_traces = 10; % Maximum number of traces to check
    person_ids = [1, 2, 3]; % List of person IDs to process
    
    % Initialize an empty cell array for the new data
    newCellArray = cell(max_traces, numel(person_ids));
    
    % Loop through each person ID
    for col = 1:numel(person_ids)
        person_id = person_ids(col); % Current person ID
    
        % Loop through all traces up to the maximum
        for trace_num = 1:max_traces
            try
                % Access the data for the current person, trace, and amplification
                currentData = people{person_id}.Sen{sensor_num}.S{speed_scale}{trace_num, amplification};
    
                % Use the processing_stage function to manipulate the signals
                % before saving them
                % AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    
                % Add the data to the corresponding cell in the array
                newCellArray{trace_num, col} = currentData;
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
    fileName = 'newCellArray.mat';    % Desired file name
    fullFilePath = fullfile(folderPath, fileName); % Combine folder path and file name
    
    % Save the data
    save(fullFilePath, 'newCellArray');
    
    % Display the resulting cell array
    disp(newCellArray);
end





