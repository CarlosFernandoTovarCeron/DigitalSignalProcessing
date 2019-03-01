% Sine signal sound
signal_frecuency=300; %signal frequency in Hz
signal_frecuency_rads_per_sec=2*pi*signal_frecuency; %signal frequency in rad/s
sampling_frecuency_hz=6000; %sampling frequency in Hz
time_interval=1/sampling_frecuency_hz; %time interval between samples;
signal_duration=0.5; %duration of signal in seconds
time=0:time_interval:(signal_duration-time_interval); %time intervals set (5 seconds)
y=sin(signal_frecuency_rads_per_sec*time); %signal data set
sound(y,sampling_frecuency_hz); %sound
time=0:time_interval:(0.01-time_interval); %time intervals set (0.01 second)
y=sin(signal_frecuency_rads_per_sec*time); %signal data set
plot(time,y,'k'); %plots figure
axis([0 0.01 -1.5 1.5]);
xlabel('seconds'); title('sine signal');