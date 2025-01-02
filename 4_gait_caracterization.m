% function [outputArg1,outputArg2] = gait_caracterization(inputArg1,inputArg2)
% %GAIT_CARACTERIZATION Summary of this function goes here
% %   Detailed explanation goes here
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
% end


% Example Signal Setup
fs = 1000;               % Sampling frequency
t = 0:1/fs:1-1/fs;       % Time vector
original_signal = sin(2*pi*50*t) + 0.5*sin(2*pi*200*t);  % Example signal

% % Filter the Signal
% fc = 100;                % Cutoff frequency
% [b, a] = butter(2, fc/(fs/2), 'low');  % 2nd-order Butterworth filter
% filtered_signal = filtfilt(b, a, original_signal);
% 
% % Log Data to Simulation Data Inspector
% runID = Simulink.sdi.createRun('Signal Analysis');  % Create a new run
% Simulink.sdi.addSignalToRun(runID, 'Original Signal', t, original_signal);
% Simulink.sdi.addSignalToRun(runID, 'Filtered Signal', t, filtered_signal);
% 
% % Open Simulation Data Inspector
% Simulink.sdi.view;  % Open SDI to visualize the signals
time = 0:0.1:10;
data = sin(time);
Simulink.sdi.plot(original_signal,t);


