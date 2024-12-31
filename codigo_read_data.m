clear;clc;
%% read footstep trace ata

% load data
load People

%%%%%%%%%%%%%%%%%%%%%% select a footstep trace to read %%%%%%%%%%%%%%%%%%%%
% person_id: identifity of the person 
%            choose from [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
person_id = 1;

% sensor_num: the sensor number
%             choose from [1,2,3,4,5]
%             NOTE: data from some sensors could be empty due to sensory issues
sensor_num = 1;

% speed_scale: speed of walking represent the speed of mu, mu+sigma, mu+2*sigma, 
%              mu+3*sigma, mu-sigma, mu-2*sigma, mu-3*sigma, and self-selected speed
%              choose from [1, 2, 3, 4, 5, 6, 7, 8]
%              NOTE: mu and sigma are average and standard deviations of
%              step frequency
speed_scale = 7;

% amplification: the amplification factor 1) 6000x, 2) 4000x, 3) 2000x 
%                choose from [1, 2, 3]
amplification = 1;

% trace_num: the footstep trace number, total number varies between 10 to 13
%            choose from [1, 2, 3, ..., total number]
trace_num = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% read data
data = people{person_id}.Sen{sensor_num}.S{speed_scale}...
    {trace_num, amplification};

% plot data
fs = 25600;
time = 0 : 1/fs : (1/fs) * (length(data) - 1);

figure
plot(time, data)
xlabel("Time (s)")
ylabel("Voltage (V)")
title("Sample Footstep-Induced Floor Vibration Data")
