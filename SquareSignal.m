% Square signal
signal_frecuency_hz=100; %signal frequency in Hz
signal_frecuency_rads_per_sec=2*pi*signal_frecuency_hz; %signal frequency in rad/s
signal_duration=0.03; %signal duration in seconds
sampling_frecuency_hz=20000; %sampling frequency in Hz
time_interval=1/sampling_frecuency_hz; %time interval between samples;
time=0:time_interval:(signal_duration-time_interval); %time intervals set
y=square(signal_frecuency_rads_per_sec*time); %signal data set
plot(time,y,'k'); %plots figure
axis([0 signal_duration -1.5 1.5]);
xlabel('seconds'); title('square signal');