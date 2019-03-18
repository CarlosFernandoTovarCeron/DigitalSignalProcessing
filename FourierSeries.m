n=20;
signal_frecuency_hz=100; %signal frequency in Hz (fundamental frencuency of p, lowest frecuency)
period_sec = 1/signal_frecuency_hz;
p1 = @(t) 0.6*sin(signal_frecuency_rads_per_sec*t);
p2 = @(t) 0.3*sin(3*signal_frecuency_rads_per_sec*t);
p3 = @(t) 0.2*sin(5*signal_frecuency_rads_per_sec*t);
p = @(t) p1(t) + p2(t) + p3(t);
a = zeros(1, n);
b = zeros(1, n);

for i=1:n
  f1_cos = @(t) cos(2*pi*(1/period_sec*t*i));
  f1_sin = @(t) sin(2*pi*(1/period_sec)*t*i);
  a(i) = (2/period_sec) * integral(@(t) f1_cos(t) .* p(t), -period_sec/2, period_sec/2);
  b(i) = (2/period_sec) * integral(@(t) f1_sin(t) .* p(t), -period_sec/2, period_sec/2);
end

a0 = (2/period_sec)*integral(@(t) p(t), -period_sec/2, period_sec/2);
signal_fourier = @(t) (a0/2);
for i=1:n
   aux1 = @(t) a(i)*cos(2*pi*i*(1/period_sec)*t);
   aux2 = @(t) b(i)*sin(2*pi*i*(1/period_sec)*t);
   signal_fourier = @(t) signal_fourier(t) + aux1(t) + aux2(t);
end

axis([0 0.01 -1.5 1.5]);
xlabel('seconds'); title('Fourier Series Example');
plot(time,feval(signal_fourier, time),'-.r*');  hold on; %plots figure
plot(time,feval(p, time),'b','LineWidth',1);  hold on; %plots figure
