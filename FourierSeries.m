n=5;
sampling_frecuency_hz=10000; %sampling frequency in Hz
time_interval=1/sampling_frecuency_hz; %time interval between samples;
signal_duration=0.02; %signal duration in seconds
time=0:time_interval:(signal_duration-time_interval); %time intervals set
signal_frecuency_hz=100; %signal frequency in Hz (fundamental frencuency of p, lowest frecuency)
signal_frecuency_rads_per_sec = 2*pi*signal_frecuency_hz;
period_sec = 1/signal_frecuency_hz;
p1 = @(t) 0.6*sin(signal_frecuency_rads_per_sec*t);
p2 = @(t) 0.3*sin(3*signal_frecuency_rads_per_sec*t);
p3 = @(t) 0.2*sin(5*signal_frecuency_rads_per_sec*t);
p = @(t) p1(t) + p2(t) + p3(t);
a = zeros(1, n);
b = zeros(1, n);

for i=1:n
  f1_cos = @(t) cos(signal_frecuency_rads_per_sec*t*i);
  f1_sin = @(t) sin(signal_frecuency_rads_per_sec*t*i);
  a(i) = (2/period_sec) * integral(@(t) f1_cos(t) .* p(t), -period_sec/2, period_sec/2);
  b(i) = (2/period_sec) * integral(@(t) f1_sin(t) .* p(t), -period_sec/2, period_sec/2);
end

a0 = (2/period_sec)*integral(@(t) p(t), -period_sec/2, period_sec/2);
signal_fourier = @(t) (a0/2);
for i=1:n
   aux1 = @(t) a(i)*cos(i*signal_frecuency_rads_per_sec*t);
   aux2 = @(t) b(i)*sin(i*signal_frecuency_rads_per_sec*t);
   signal_fourier = @(t) signal_fourier(t) + aux1(t) + aux2(t);
end

axis([0 0.02 -1.5 1.5]);
xlabel('seconds'); title('Fourier Series Example');
plot(time,feval(signal_fourier, time),'-.r*');  hold on; %plots figure
plot(time,feval(p, time),'b','LineWidth',1);  hold on; %plots figure