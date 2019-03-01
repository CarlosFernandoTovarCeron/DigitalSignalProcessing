% Sine signal
signal_frecuency=2; %signal frequency in Hz
signal_frecuency_rads=2*pi*signal_frecuency; %signal frequency in rad/s
sampling_frecuency=60; %sampling frequency in Hz
time_inverval=1/sampling_frecuency; %time interval between samples;
signal_duration=5; %signal duration in seconds
time=0:time_inverval:(signal_duration-time_inverval); %time intervals set
y=sin(signal_frecuency_rads*time); %signal data set
plot(time,y,'r'); %plots figure in red
axis([0 seconds_signal -1.5 1.5]);
xlabel('seconds'); title('sine signal');