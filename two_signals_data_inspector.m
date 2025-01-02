function comparing_signals(data_1, data_2, fs_or_bins)
    Simulink.sdi.clear

    time_1 = 0 : 1/fs_or_bins : (1/fs_or_bins) * (length(data_1) - 1); % Time vector for 1 second of data

    data_1_ts = timeseries(data_1, time_1);
    data_1_ts.Name = "data-ID, T = 1";
    
    time_2 = 0 : 1/fs_or_bins : (1/fs_or_bins) * (length(data_1) - 1); % Time vector for 1 second of data

    data_2_ts = timeseries(data_2, time_2);
    data_2_ts.Name = "filtered_data_-ID, T = 1";

    gaitssRun = Simulink.sdi.Run.create;
    gaitssRun.Name = "Gait_time_analysis";
    gaitssRun.Description = "This is the analysis of person's gait with its filtered signal";

    % Simulink.sdi.setVisualization(1,1,'timeplot');
    
    add(gaitssRun,"vars", data_1_ts, data_2_ts);

    Simulink.sdi.view

    % % Specify the folder and file name
    % folderPath = 'C:\Users\Daniel\OneDrive - correounivalle.edu.co\Univalle\09_Noveno_semestre\DSP\Proyecto_2\data_inspector';  % Replace with your desired folder path
    % fileName = 'Gait_data.mldatx';    % Desired file name
    % fullPath = fullfile(folderPath, fileName);  % Combine folder and file name
    % 
    % % Save the SDI session
    % Simulink.sdi.save(fullPath);
        
end

load People

raw_data = read_footstep_trace_data(1, 1, 1, 1, 1);

load new_data_set
processed_data = new_data_set{1, 1};

comparing_signals(raw_data, processed_data, 1000)