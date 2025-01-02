function data_inspector(domain, data, filtered_data, fs_or_bins)
    if strcmp(domain, 'time')

        Simulink.sdi.clear

        time = 0 : 1/fs_or_bins : (1/fs_or_bins) * (length(data) - 1); % Time vector for 1 second of data

        data_ts = timeseries(data, time);
        data_ts.Name = "data-ID, T = 1";
    
        filtered_data_ts = timeseries(filtered_data, time);
        filtered_data_ts.Name = "filtered_data_-ID, T = 1";
    
        gaitssRun = Simulink.sdi.Run.create;
        gaitssRun.Name = "Gait_time_analysis";
        gaitssRun.Description = "This is the analysis of person's gait with its filtered signal";

        % Simulink.sdi.setVisualization(1,1,'timeplot');
        
        add(gaitssRun,"vars", data_ts, filtered_data_ts);
    elseif strcmp(domain, 'frequency')
        data_ts = timeseries(data, fs_or_bins);
        data_ts.Name = "Gait_frequency_-ID, T = 1";
    
        filtered_data_ts = timeseries(filtered_data, fs_or_bins);
        filtered_data_ts.Name = "Gait_filtered_frequency_-ID, T = 1";
    
        gaits_frequencysRun = Simulink.sdi.Run.create;
        gaits_frequencysRun.Name = "Gait_frequency_analysis";
        gaits_frequencysRun.Description = "This is the analysis of person's gait in frequency with its filtered signal";
        
        % Simulink.sdi.setSubPlotLayout(2,1);
        % plotOnSubPlot(filtered_data_ts,2,1,true);

        add(gaits_frequencysRun,"vars", data_ts, filtered_data_ts);



    end
        % Specify the folder and file name
        folderPath = 'C:\Users\Daniel\OneDrive - correounivalle.edu.co\Univalle\09_Noveno_semestre\DSP\Proyecto_2\data_inspector';  % Replace with your desired folder path
        fileName = 'Gait_data.mldatx';    % Desired file name
        fullPath = fullfile(folderPath, fileName);  % Combine folder and file name
        
        Simulink.sdi.view
        % Save the SDI session
        Simulink.sdi.save(fullPath);
        
end


