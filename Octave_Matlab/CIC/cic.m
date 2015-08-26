% A CIC filter example

Fs = 125e6; % Sample rate (Hz)
f  = 1e6;   % Signal frequency (Hz)
siglen = 10000; % Signal length (samples)

t = (0:siglen-1) * 1/Fs;
freq = (-1:2/(numel(t)-1):1) * Fs;

%x = sin(2*pi*f*t); % Signal
x = rand(1,numel(t)) - 0.5;

%% A 2 stage CIC filter

D = 20;

y = zeros(1,numel(x));

for n = (1 + D):numel(x)
	y(n) = y(n-1) + 1/D * (x(n) - x(n-D));
end

% Plot time domain waveforms

figure
subplot(2,1,1)
plot(t,x);
title('Input signal')
subplot(2,1,2)
plot(t,y)
title('Filtered signal')

% Plot frequency spectrum

X = fftshift(fft(x));
Y = fftshift(fft(y .* hann(numel(y))'));

figure
subplot(2,1,1)
plot(freq, 20 * log10(abs(X)))
title('Input signal spectrum')
subplot(2,1,2)
plot(freq, 20 * log10(abs(Y)))
title('Filtered spectrum')
