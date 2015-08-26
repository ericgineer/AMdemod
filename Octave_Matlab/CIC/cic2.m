clear all
close all
clc

% CIC frequency domain example

M = 12500; % Decimation factor

K = 20; % Number of stages

Fs = 125e6; % Sample rate (Hz)

freq = (-1:1e-4:1) / M;

w = 2 * pi * freq;

z = e.^(1j * w);

% CIC filter frequency response

H = (1 / M * (1 - z .^ (-M)) ./ (1 - z .^ (-1))) .^ K;


% Plot CIC filter frequency response and phase response

Hdb = 20 * log10(abs(H));

H_phase = atan2(imag(H),real(H));

figure
subplot(2,1,1)
plot(freq, Hdb)
title('CIC magnitude response')
ylabel('|dB|')
xlabel('Frequency (Hz)')
axis([min(freq) max(freq) -350 0])
grid on
subplot(2,1,2)
plot(freq, H_phase)
title('CIC phase response')
ylabel('angle (rad)')
xlabel('Frequency (Hz)')
axis([min(freq) max(freq) -pi pi])
grid on


% Create correction FIR filter (decimate by 2)
x = 4; % Scale factor

%%%%%%% fir2.m parameters %%%%%%
L = 110; 		%% Filter order; must be even
Fo = 0.1; 	%% Normalized Cutoff freq; 0<Fo<=0.5/M;

%%%%%%% CIC Compensator Design using fir2.m %%%%%%
p = 2e3; 		%% Granularity
s = 0.25/p; 	%% Step size
fp = [0:s:Fo]; 	%% Pass band frequency samples
fs = (Fo+s):s:1; %% Stop band frequency samples
f = [fp fs]; 	%% Normalized frequency samples; 0<=f<=1
Mp = ones(1,length(fp)); %% Pass band response; Mp(1)=1
Mp(2:end) = abs(x*sin(pi*fp(2:end)/x)./sin(pi*fp(2:end)));
Mf = [Mp zeros(1,length(fs))];
f(end) = 1;
h = fir2(L,f,Mf); %% Filter length L+1
h = h/max(h); %% Floating point coefficients

[H_fir, w_fir] = freqz(h, 1, -pi:2*pi/(numel(w)-1):pi, "whole");

figure
subplot(2,1,1)
plot(w, 20 * log10(abs(H_fir)))
title('Compensation FIR frequency response')
grid on
subplot(2,1,2)
plot(w, atan(imag(H_fir)./real(H_fir)))
title('Compensation FIR phase response')
grid on

% Compensated response

H_comp = H .* H_fir;

figure
subplot(2,1,1)
plot(w, 20 * log10(abs(H_comp)))
axis([min(w) max(w) -250 0])
grid on
title('Compensated frequency response')
subplot(2,1,2)
plot(w, atan(imag(H_comp)./real(H_comp)))
axis([min(w) max(w) -pi pi])
grid on
title('Compensated phase response')
