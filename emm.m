signal = read_footstep_trace_data(1, 1, 1, 1, 1);
% 
% signal_plot(signal, 'señal', 'tiempo', 'amplitud');
time = length(signal);
figure;
plot(time, signal);
title('a');
xlabel('a');
ylabel('a');
grid on;