%%% Author:  Aditya Jain & Taneea S Agrawaal %%%%%%%%%%%%%%%%%
%%% Topic: Radar Systems Project; 15-bit PRN/MLS Code %%%
%%% Date: 14th April, 2018 %%%%%%%%%%

clc
clear
close all

%% Variable Declaration
n = 15;              % n-bit PRN code
N = n*100;        % No. of data points on the time axis
T = 1;              % Time duration of the pulse
% xaxis = 0:dt:(N-1)*dt;
xaxis = linspace(0,T,N);

% The final prn sequence is below
code = [1, -1, -1, -1, 1, 1, 1, 1, -1, 1, -1, 1, 1, -1, -1];


%% Building the transmitted signal
Tx_signal = ones(1,N); % initialising the transmitted signal
i = 1; 
for n=1:N       
    Tx_signal(1,n) = code(i);    
    if mod(n,100)==0
        i = i + 1;
    end
end


figure
plot(xaxis, Tx_signal)
axis([0 1.5 -2 2])
xlabel('Time axis (in sec)')
ylabel('Txed signal strength in linear scale')
title('15-bit PRN code')

%% Matched Filter Output
xaxis_new = linspace(-T,T,2*N-1);      % x-axis of the matched filter output
Sout = xcorr(Tx_signal,Tx_signal)./100;        % auto-correlation

figure
plot(xaxis_new, Sout)
xlabel('Time Axis (in sec)')
ylabel('Filter output in linear scale')
title('Matched Filter of 15-bit PRN Code')

%% in dB Scale
figure
plot(xaxis_new, 20*log10(Sout))
xlabel('Time Axis (in sec)')
ylabel('Filter output in log scale')
title('Matched Filter of 15-bit PRN Code (log scale)')