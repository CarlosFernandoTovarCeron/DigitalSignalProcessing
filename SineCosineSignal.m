% Sine and cosine signals
signal_frecuency_hz=1; %signal frequency in Hz
signal_frecuencty_rads_per_sec=2*pi*signal_frecuency_hz; %signal frequency in rad/s
sampling_frecuency_hz=60; %sampling frequency in Hz
time_interval=1/sampling_frecuency_hz; %time interval between samples;
signal_duration=3; % duration of the signal
time=0:time_interval:(signal_duration-time_interval); %time intervals set
ys=sin(signal_frecuencty_rads_per_sec*time); %signal data set
plot(time,ys,'r'); hold on; %plots figure
axis([0 signal_duration -1.5 1.5]);
xlabel('seconds');
yc=cos(signal_frecuencty_rads_per_sec*time); %signal data set
plot(time,yc,'--k'); %plot with points
axis([0 3 -1.5 1.5]);
xlabel('seconds'); title('sine (solid and red) and cosine (dashed)');