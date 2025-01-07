function signal_plot(signal, titulo, x_label, y_label);
    time = (0:length(signal)-1) / fs; % Vector de tiempo en segundos
    figure;
    plot(time, signal);
    title('señal');
    xlabel('tiempo');
    ylabel('amplitud');
    grid on;
end

% scalogram(signal, 1000);