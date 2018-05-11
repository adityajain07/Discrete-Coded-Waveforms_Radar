%%% Author:  Aditya Jain & Taneea S Agrawaal %%%%%%%%%%%%%%%%%
%%% Topic: Radar Systems Project; B54 Barker Code %%%
%%% Date: 14th April, 2018 %%%%%%%%%%

clc
clear
close all

%% Variable Declaration
m = 5;              % m in the barker code
n = 4;              % n in the barker code
N = m*n*100;           % No. of data points on the time axis, each peak is represented by 100 points on the axis
T = 1;              % pulse duration in seconds
xaxis = linspace(0,T,N);
Tx_signal = ones(1,N);      % initialising the transmitted signal
count = 1;                  % this helps to fill the places in transmitted signal array
Bfour = [1, 1, -1, 1];      % barker code for 4 bit
Bfive = [1, 1, 1, -1, 1];   % barker code for 5 bit
BfiveInvert = [-1, -1, -1, 1, -1];  % Inverted barker code for 5 bit

for i = 1:n    
    for j = 1:m
        
       if (Bfour(i) == 1)
           Tx_signal(count:count+99) = Bfive(j);
           
       else
           Tx_signal(count:count+99) = BfiveInvert(j);           
       end   
       
       count = count + 100;
    end   
end


figure
plot(xaxis, Tx_signal)
axis([0 1.5 -2 2])
xlabel('Time axis (in sec)')
ylabel('Txed signal strength in linear scale')
title('Binary Phase-Coded B54 Barker Code')

%% Matched Filter Output
xaxis_new = linspace(-T,T,2*N-1);      % x-axis of the matched filter output
Sout = xcorr(Tx_signal,Tx_signal)./100;        % auto-correlation

figure
plot(xaxis_new, Sout)
xlabel('Time Axis (in sec)')
ylabel('Filter output in linear scale')
title('Matched Filter of Binary Phase-Coded B54 Barker Code')

%% in dB Scale
figure
plot(xaxis_new, 20*log10(Sout))
xlabel('Time Axis (in sec)')
ylabel('Filter output in log scale')
title('Matched Filter of Binary Phase-Coded B54 Barker Code (log scale)')