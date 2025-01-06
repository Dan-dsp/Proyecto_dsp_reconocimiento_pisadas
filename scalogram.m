function scalogram(signal, fs)
    % Wavelet Transform
    figure;
    cwt(signal, 'amor', fs); % 'amor' uses Morlet wavelet, adjust as needed
    title('Magnitude Scalogram of the Signal');
    colorbar;
end