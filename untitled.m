% function [outputArg1,outputArg2] = untitled(inputArg1,inputArg2)
% %UNTITLED Summary of this function goes here
% %   Detailed explanation goes here
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
% end

time = linspace(0,20,100);

sine_vals = sin(2*pi/5*time);
sine_ts = timeseries(sine_vals,time);
sine_ts.Name = "Sine, T=5";

cos_vals = cos(2*pi/8*time);
cos_ts = timeseries(cos_vals,time);
cos_ts.Name = "Cosine, T=8";

Simulink.sdi.clear

sinusoidsRun = Simulink.sdi.Run.create;
sinusoidsRun.Name = "Sinusoids";
sinusoidsRun.Description = "Sine and cosine signals with different frequencies";

add(sinusoidsRun,"vars",sine_ts,cos_ts);

% Specify the folder and file name
folderPath = 'C:\Users\Daniel\OneDrive - correounivalle.edu.co\Univalle\09_Noveno_semestre\DSP\Proyecto_2\data_inspector';  % Replace with your desired folder path
fileName = 'MyRunFile.mldatx';    % Desired file name
fullPath = fullfile(folderPath, fileName);  % Combine folder and file name

Simulink.sdi.view

% Save the SDI session
Simulink.sdi.save(fullPath);

% Simulink.sdi.close("sinusoids.mldatx")



