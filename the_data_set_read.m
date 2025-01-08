function data = the_data_set_read(identification, trace_number)
%READ_FOOTSTEP_TRACE_DATA Summary of this function goes here

% clear;clc;

% read footstep trace ata
% load data (remember to have your dataset's path already added in your worksapce)
load the_data_set

data = the_data_set{trace_number, identification};

end



