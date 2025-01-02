% function [outputArg1,outputArg2] = dataset_construction(inputArg1,inputArg2)
% %DATASET_CONSTRUCTION Summary of this function goes here
% %   Detailed explanation goes here
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
% end
% 

load People

% Parameters
person_id = 1;
sensor_num = 1;
speed_scale = 1;
amplification = 1;
max_traces = 10; % Maximum number of traces to check

% Initialize an empty cell array for the new data
newCellArray = cell(max_traces, 1);

% Loop through all traces up to the maximum
for trace_num = 1:max_traces
    try
        % Access the data for the current trace and amplification
        currentData = people{person_id}.Sen{sensor_num}.S{speed_scale}{trace_num, amplification};
        
        % Filter the data before saving it into the new array
        % AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

        % Add the data to the new cell array
        newCellArray{trace_num, 1} = currentData;
    catch
        % Stop if an error occurs (e.g., trace number out of bounds)
        disp(['Error or no data found for trace ', num2str(trace_num)]);
        break;
    end
end

% Remove empty rows from the cell array (optional)
newCellArray = newCellArray(~cellfun('isempty', newCellArray));

% Save the array to a specific folder path
folderPath = 'C:\Users\Daniel\OneDrive - correounivalle.edu.co\Univalle\09_Noveno_semestre\DSP\Proyecto_2\data_set'; % Replace with your desired folder path
fileName = 'newCellArray.mat';    % Desired file name
fullFilePath = fullfile(folderPath, fileName); % Combine folder path and file name

% Save the data
save(fullFilePath, 'newCellArray');

% Display the resulting cell array
disp(newCellArray);



