% Define the sample rate and signal duration
Fs = 1000;                    % Sampling frequency in Hz
T = 1/Fs;                     % Sampling period in seconds
L = 1500;                     % Length of signal
t = (0:L-1)*T;                % Time vector

% Create a composite signal with multiple sine waves
frequencies = [50, 120, 300]; % Frequencies of the sine waves in Hz
amplitudes = [0.7, 0.5, 0.3]; % Amplitudes of the sine waves
signal = amplitudes(1)*sin(2*pi*frequencies(1)*t) ...
       + amplitudes(2)*sin(2*pi*frequencies(2)*t) ...
       + amplitudes(3)*sin(2*pi*frequencies(3)*t);

% Compute the Fourier Transform using MATLAB's fft function
Y = fft(signal);

% Compute the two-sided spectrum then convert to single-sided spectrum
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% Define the frequency domain f
f = Fs*(0:(L/2))/L;

% Plotting the time domain signal
subplot(2,1,1);
plot(t, signal);
title('Time Domain - Composite Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

% Plotting the frequency domain signal
subplot(2,1,2);
plot(f, P1);
title('Frequency Domain - Spectrum');
xlabel('Frequency (Hz)');
ylabel('|P1(f)|');

% Display the plots
figure;
