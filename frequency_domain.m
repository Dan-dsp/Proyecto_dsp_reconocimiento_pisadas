function [frequency_response, frequency_bins] = frequency_domain(data, fs)
    % Compute the Fourier Transform
    N = length(data);               % Length of the signal
    fft_signal = fft(data);         % Compute FFT
    P2 = abs(fft_signal / N);         % Two-sided spectrum
    P1 = P2(1:N/2+1);                 % Single-sided spectrum
    P1(2:end-1) = 2*P1(2:end-1);      % Scale for single-sided
    
    % Frequency axis
    f = fs * (0:(N/2)) / N;           % Frequency bins
    
    frequency_response = P1;
    frequency_bins = f;

    % Plot the frequency domain
    figure;
    plot(f, P1);
    title('Frequency Domain of the Signal');
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');
    grid on;
end