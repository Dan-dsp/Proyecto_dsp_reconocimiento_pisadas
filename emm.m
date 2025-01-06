signal = read_footstep_trace_data(1, 1, 1, 1, 1);
% 
% function signal_plot(signal, 'señal', 'tiempo', 'amplitud');
% time = length(signal);
% figure;
% plot(time, signal);
% title('señal');
% xlabel('tiempo');
% ylabel('amplitud');
% grid on;

scalogram(signal, 1000);