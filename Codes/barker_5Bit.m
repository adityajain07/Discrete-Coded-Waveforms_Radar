%%% Author:  Aditya Jain & Taneea S Agrawaal %%%%%%%%%%%%%%%%%
%%% Topic: Radar Systems Project; 5-bit Binary Barker Code %%%
%%% Date: 14th April, 2018 %%%%%%%%%%

clc
clear
close all

%% Variable Declaration
n = 5;              % barker code length
N = n*100;           % No. of data points on the time axis
length = 5*n;
T = 1;              % pulse time in seconds
% xaxis = 0:dt:(N-1)*dt;
xaxis = linspace(0,T,N);
Tx_signal = ones(1,N); % initialising the transmitted signal

for n=1:N
    if n>300 && n<400
        Tx_signal(1,n) = -1;
    end
end


figure
plot(xaxis, Tx_signal)
axis([0 1.5 -2 2])
xlabel('Time axis (in seconds)')
ylabel('Txed signal strength in linear scale')
title('Binary 5-bit Phase-Coded Barker Code')

%% Matched Filter Output
xaxis_new = linspace(-T,T,2*N-1);      % x-axis of the matched filter output
Sout = xcorr(Tx_signal,Tx_signal)./100;        % auto-correlation

figure
plot(xaxis_new, Sout)
xlabel('Time Axis (in seconds)')
ylabel('Filter output in linear scale')
title('Matched Filter of Binary 5-Bit Barker Code')

%% in dB Scale
figure
plot(xaxis_new, 20*log10(Sout))
xlabel('Time Axis (in seconds)')
ylabel('Filter output in log scale')
title('Matched Filter of Binary 5-Bit Barker Code (log scale)')