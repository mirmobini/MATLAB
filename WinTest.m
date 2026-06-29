%% Initializing MATLAB
close all
clear
clc
%% Creating a Signal
% Signal Specifications
A = 3; % Amplitude(v)
F = 1; % Frequency(Hz)
theta = (1/2)*pi; % Phase(Radian)
TD = 10; % Time Duration(s)
Fs = 1024; % Sampling Frequency(Hz)

% Time Domain Variables
Ts = 1/Fs; % Sampling period
L = TD*Fs; % Length of signal (Number of samples)
t = (0:L-1)*Ts; % Time Axes
omega = 2*pi*F; % Angular Velocity

% Frequency Domain Variables
nfft = 2^nextpow2(L); % Fast Fourier Transform Optimum Data Points
f = (-nfft/2:nfft/2-1)*(Fs/nfft); % Frequency Axes
%% Creating The Signal
S = A*sin(omega*t+theta); % Sine Wave
% S = A*(sin(omega*t+theta) + cos(omega*2*t+theta) +...
%     sin(omega*3*t+theta) + cos(omega*4*t+theta)); % Mixed Signal
%% Visualizing The Signal
% Time Domain
figure('Name','Signal Windowing')
subplot(3,2,[1,2]);
plot(t,S)
xlim([min(t) max(t)])
xlabel('time(s)'),ylabel('Amplitude(v)')
title('Original Signal (Time Domain)')
% Frequency Domain
y = fftshift(fft(S,nfft))/nfft;
power = abs(y).^2;

subplot(3,2,[3,4]);
plot(f,power)
xlim([min(f) max(f)]) % xlim([-round(Fs/2) round(Fs/2)])
xlabel('Frequency(Hz)'),ylabel('power')
title('Original Signal (Frequency Domain)')
drawnow
%% windowing
W = 1; % S
WN = round(W*Fs);
WS = windowing(S,WN,true,0);
n = randperm(size(WS,1),1);
Wt = ((n-1)*WN:n*WN-1)*Ts;

if n<10
    n1 = n;
else
    n1 = mod(n,10);
end
switch n1
    case 1
        TS = sprintf('%dst Window  Length = %gs',n,WN*Ts);
    case 2
        TS = sprintf('%dnd Window  Length = %gs',n,WN*Ts);
    case 3
        TS = sprintf('%drd Window  Length = %gs',n,WN*Ts);
    otherwise
        TS = sprintf('%dth Window  Length = %gs',n,WN*Ts);
end

subplot(3,2,5)
plot(Wt,WS(n,:))
xlim([min(Wt) max(Wt)])
xlabel('time(s)'),ylabel('Amplitude(v)')
title(TS)
drawnow

Wnfft = 2^nextpow2(WN); % Fast Fourier Transform Optimum Data Points
Wf = (-Wnfft/2:Wnfft/2-1)*(Fs/Wnfft); % Frequency border
Wy = fftshift(fft(WS(n,:),Wnfft))/Wnfft;
Wpower = abs(Wy).^2;
subplot(3,2,6)
plot(Wf,Wpower)
xlim([min(Wf) max(Wf)])
xlabel('Frequency(Hz)'),ylabel('Power')
title(TS)
drawnow
%% All Windows
Wt = (0:WN-1)*Ts;
Wnfft = 2^nextpow2(WN); % Fast Fourier Transform Optimum Data Points
Wf = (-Wnfft/2:Wnfft/2-1)*(Fs/Wnfft); % Frequency border

figure('Name','All Windows')
for nn = 1: size(WS,1)
    
    Wy = fftshift(fft(WS(nn,:),Wnfft))/Wnfft;
    Wpower = abs(Wy).^2;
    
    subplot 211
    plot(Wt,WS(nn,:))
    xlim([min(Wt) max(Wt)])
    xlabel('time(s)'),ylabel('Amplitude(v)')
    title(['Time Domain- Window Number: ',num2str(nn)])
    hold on
    subplot 212
    plot(Wf,Wpower)
    xlim([min(Wf) max(Wf)])
    xlabel('Frequency(Hz)'),ylabel('Power')
    title(['Frequency Domain- Window Number: ',num2str(nn)])
    hold on
    pause(0.2)
    
end