% Sum of sines signal
signal_frecuency_hz=300; %signal frequency in Hz
signal_frecuency_rads_per_sec=2*pi*signal_frecuency_hz; %signal frequency in rad/s
sampling_frecuency_hz=12000; %sampling frequency in Hz
time_interval=1/sampling_frecuency_hz; %time interval between samples;
signal_duration=5; %signal duration in seconds
time=0:time_interval:(signal_duration-time_interval); %time intervals set (5 seconds)
%signal data set:
y=0.64*sin(signal_frecuency_rads_per_sec*time)+0.21*sin(3*signal_frecuency_rads_per_sec*time)+0.12*sin(5*signal_frecuency_rads_per_sec*time);
sound(y,sampling_frecuency_hz); %sound
time=0:time_interval:(0.01-time_interval); %time intervals set (0.01 second)
%signal data set:
y1=0.6*sin(signal_frecuency_rads_per_sec*time); %frecuency: 1*signal_frecuency_hz hz (red)
y2=0.3*sin(3*signal_frecuency_rads_per_sec*time); %frecuency: 3*signal_frecuency_hz hz (blue)
y3=0.2*sin(5*signal_frecuency_rads_per_sec*time); %frecuency: 5*signal_frecuency_hz hz (green)
y=0.6*sin(signal_frecuency_rads_per_sec*time)+0.3*sin(3*signal_frecuency_rads_per_sec*time)+0.2*sin(5*signal_frecuency_rads_per_sec*time); % y1 + y2 + y3
plot(time,y,'k');  hold on; %plots figure
plot(time,y1,'r'); hold on; %plots figure
plot(time,y2,'b'); hold on; %plots figure
plot(time,y3,'g'); hold on;%plots figure
axis([0 0.01 -1.5 1.5]);
xlabel('seconds'); title('sum of sines signal');