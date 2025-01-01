function data_inspector(data, filtered_data, fs)
    time = 0 : 1/fs : (1/fs) * (length(data) - 1); % Time vector for 1 second of data

    data_ts = timeseries(data, time);
    data_ts.Name = "Gait_-ID, T = 1";

    filtered_data_ts = timeseries(filtered_data, time);
    filtered_data_ts.Name = "Gait_-ID, T = 1";

    Simulink.sdi.clear

    gaitssRun = Simulink.sdi.Run.create;
    gaitssRun.Name = "Gait_analysis";
    gaitssRun.Description = "This is the anlysis of person's gait with its filtered signal";
    
    add(gaitssRun,"vars",data_ts, filtered_data_ts);
    
    % Specify the folder and file name
    folderPath = 'C:\Users\Daniel\OneDrive - correounivalle.edu.co\Univalle\09_Noveno_semestre\DSP\Proyecto_2\data_inspector';  % Replace with your desired folder path
    fileName = 'Gait_data.mldatx';    % Desired file name
    fullPath = fullfile(folderPath, fileName);  % Combine folder and file name
    
    Simulink.sdi.view
    % Save the SDI session
    Simulink.sdi.save(fullPath);
end




