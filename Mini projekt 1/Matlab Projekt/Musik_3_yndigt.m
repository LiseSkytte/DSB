clear 
[x, fsample]= wavread('yndigt_land');

x= x(200000:641000-1);

N = length(x);
Tlength = N/fsample;
t1=[0:N-1]/fsample;


y = fft(x,N);

delta_f = fsample/N;
f_axis = [0:delta_f:fsample-delta_f];

figure(1)
plot(t1,x)
xlabel('Tid i sekunder')
ylabel('Amplitude volt')
title('Plot af signalet')
grid on

figure(2)
plot(f_axis(1:0.5*end), abs((2/N)*y(1:0.5*end)))
xlabel('Frekvens i Hz')
ylabel('St�rrelse volt')
title('DFT st�rrelse magnitude')
grid on


figure(3)
semilogx(f_axis(1:0.5*end), abs((2/N)*y(1:0.5*end)))
xlabel('Frekvens i Hz')
ylabel('St�rrelse dB')
title('DFT st�rrelse magnitude')
grid on


figure(4)
plot(f_axis(1:0.5*end), unwrap(angle(y(1:0.5*end)))) %Unwrap bruges til at l�gge faserne sammen
xlabel('Frekvens i Hz')
ylabel('Fase')
title('DFT fase')
grid on

