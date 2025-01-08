function signal_plot(axes, signal, titulo, x_label, y_label)
    fs = 1000;
    time = (0:length(signal)-1) / fs; % Vector de tiempo en segundos

    plot(axes, time, signal);
    title(axes, titulo);
    xlabel(axes, x_label);
    ylabel(axes, y_label);
    grid(axes, 'on');
end

% function signal_plot(signal, titulo, x_label, y_label)
%     fs = 1000;
%     time = (0:length(signal)-1) / fs; % Vector de tiempo en segundos
%     figure;
%     plot(time, signal);
%     title(titulo);
%     xlabel(x_label);
%     ylabel(y_label);
%     grid on;
% end

% signal = read_footstep_trace_data(1, 1, 1, 1, 1);
% 
% % 1. Se grafica la señal capturada
% signal_plot(signal, 'Señal capturada', 'tiempo', 'amplitud');
% 
% % 2. Se grafica el escalograma
% scalogram(signal, 1000);
% 
% % Se filtra la señal
% filtered_signal = processing_stage_no_plot(signal);
% 
% % 3. Se grafica la señal filtrada
% signal_plot(filtered_signal, 'Señal filtrada', 'tiempo', 'amplitud');
% 
% % 4. Se grafica el dominio en frecuencia de la señal filtrada
% [frequency_response, frequency_bins] = frequency_domain(filtered_signal, 1000);
% 
% figure;
% plot(frequency_bins, frequency_response);
% title('Señal filtrada en frecuencia');
% xlabel('Hz');
% ylabel('Amplitud');
% grid on;


