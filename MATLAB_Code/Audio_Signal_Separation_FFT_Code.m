% Load the audio file
[y, Fs] = audioread('AudioSong.wav');

% Normalize the audio
y = y / max(abs(y));

% Define the length of the audio
N = length(y);

% Create time vector
t = (0:N-1) / Fs;

% Plot the original audio signal
subplot(4,1,1);
plot(t, y);
title('Original Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Calculate the FFT of the original audio
Y_fft = fft(y);

% Frequency vector
f = linspace(0, Fs, N); % Frequency axis for the FFT

% Plot the magnitude spectrum of the original audio
subplot(4,1,2);
plot(f, abs(Y_fft));
title('Original Audio Signal Frequency Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Design a High-Pass Filter
fc = 1000; % Cutoff frequency in Hz
[b, a] = butter(6, fc/(Fs/2), 'high'); % 6th order Butterworth high-pass filter

% Apply the filter
filtered_signal = filter(b, a, y);

% Plot the filtered signal (instrumental)
subplot(4,1,3);
plot(t, filtered_signal);
title('Filtered Signal (Instrumental)');
xlabel('Time (s)');
ylabel('Amplitude');

% Calculate the voice (difference between original and filtered)
voice_signal = y - filtered_signal;

% Plot the voice signal
subplot(4,1,4);
plot(t, voice_signal);
title('Voice Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Display the plots
sgtitle('Audio Signal Separation');

% Calculate the FFT of the voice signal
Voice_fft = fft(voice_signal);

% Plot the FFT of the voice signal
figure;
plot(f, abs(Voice_fft));
title('Voice Signal FFT');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

