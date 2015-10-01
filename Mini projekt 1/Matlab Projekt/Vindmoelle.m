clear 
[x, fsample]= wavread('vindmoelle');

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
plot(f_axis(1:0.5*end), abs((2/N)*y(1:0.5*end,1)))
xlabel('Frekvens i Hz')
ylabel('Størrelse volt')
title('DFT størrelse magnitude')
grid on

figure(3)
semilogx(f_axis(1:0.5*end), abs((2/N)*y(1:0.5*end,1)))
xlabel('Frekvens i Hz')
ylabel('Størrelse dB')
title('DFT størrelse magnitude')
grid on

figure(4)
plot(f_axis(1:0.5*end), unwrap(angle(y(1:0.5*end,1)))) %Unwrap bruges til at lægge faserne sammen
xlabel('Frekvens i Hz')
ylabel('Fase')
title('DFT fase')
grid on


