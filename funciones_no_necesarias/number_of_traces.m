function numTraceNum = number_of_traces(person_id, sensor_num, speed_scale, amplification)
    load People

    % Parameters
    % person_id = 3;       % Set person ID
    % sensor_num = 1;      % Set sensor number
    % speed_scale = 1;     % Set speed scale
    % amplification = 1;   % Set amplification
    
    % Access the matrix for the given speed scale and amplification
    matrix = people{person_id}.Sen{sensor_num}.S{speed_scale};
    
    % Determine the number of valid rows (trace_num)
    validRows = ~cellfun(@isempty, matrix(:, amplification)); % Check non-empty rows
    numTraceNum = sum(validRows); % Count the valid rows
    
    % Display the result
    disp(['Number of Trace Numbers (rows): ', num2str(numTraceNum)]);
end

