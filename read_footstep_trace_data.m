function data = read_footstep_trace_data(identification, sensor_number, speed_scalee, amplificationn, trace_number)
%READ_FOOTSTEP_TRACE_DATA Summary of this function goes here

% clear;clc;

% read footstep trace ata
% load data (remember to have your dataset's path already added in your worksapce)
load People

%%%%%%%%%%%%%%%%%%%%%% select a footstep trace to read %%%%%%%%%%%%%%%%%%%%
% person_id: identifity of the person 
%            choose from [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
person_id = identification;

% sensor_num: the sensor number
%             choose from [1,2,3,4,5]
%             NOTE: data from some sensors could be empty due to sensory issues
sensor_num = sensor_number;

% speed_scale: speed of walking represent the speed of mu, mu+sigma, mu+2*sigma, 
%              mu+3*sigma, mu-sigma, mu-2*sigma, mu-3*sigma, and self-selected speed
%              choose from [1, 2, 3, 4, 5, 6, 7, 8]
%              NOTE: mu and sigma are average and standard deviations of
%              step frequency
speed_scale = speed_scalee;

% amplification: the amplification factor 1) 6000x, 2) 4000x, 3) 2000x 
%                choose from [1, 2, 3]
amplification = amplificationn;

% trace_num: the footstep trace number, total number varies between 10 to 13
%            choose from [1, 2, 3, ..., total number]
trace_num = trace_number;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% read data
data = people{person_id}.Sen{sensor_num}.S{speed_scale}...
    {trace_num, amplification};



end

