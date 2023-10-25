% Amplitude Modulated wave
% Define parameters
Fs = 1000; % Sampling frequency (Hz)
t = 0:1/Fs:1; % Time vector (1 second duration)
Fc = 100; % Carrier frequency (Hz)
Fm = 10; % Modulating frequency (Hz)
Am = 1; % Modulating amplitude
Ac = 1;
% Generate modulating signal (message signal)
m = generateSinusoid(Am,Fm,t)
plotting(t,m,'Modulating Signal',1)

% Generate carrier signal
c = generateSinusoid(Ac,Fc,t)
plotting(t,c,'Carrier Signal',2)

% Perform amplitude modulation
AM = generateAM(m,c)
plotting(t,AM,'AM Signal',3)

function wave = generateSinusoid(A,F,t)
    wave = A * cos(2*pi*F*t);
end

function wave = generateAM(m,c)
    wave = (1 + m) .* c;
end

function plotting(t,Wave,Name,pos)
    subplot(3,1,pos);
    plot(t, Wave);
    title(Name);
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
end
