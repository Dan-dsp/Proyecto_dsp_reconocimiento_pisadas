function signal_plot(signal, titulo, x_label, y_label)
%SIGNAL_PLOT Summary of this function goes here
%   Detailed explanation goes here
    time = length(signal);
    figure;
    plot(time, signal);
    title(titulo);
    xlabel(x_label);
    ylabel(y_label);
    grid on;
end

