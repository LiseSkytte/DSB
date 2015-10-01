%%Indlæs filen ARv6.wav. Bestem antal samples, beregn DFT på signalet,
% og plot størrelse og fase. Sæt grid, labels og titel på plottene. 
%Hvad kan man erfare om signalet ved at betragte DFT spektret?
clear 
[x, fsample]= wavread('ARv6');

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
ylabel('Størrelse volt')
title('DFT størrelse magnitude')
grid on

figure(3)
semilogx(f_axis(1:0.5*end), abs((2/N)*y(1:0.5*end)))
xlabel('Frekvens i Hz')
ylabel('Størrelse dB')
title('DFT størrelse magnitude - logaritmisk')
grid on


figure(4)
plot(f_axis(1:0.5*end), unwrap(angle(y(1:0.5*end)))) %Unwrap bruges til at lægge faserne sammen
xlabel('Frekvens i Hz')
ylabel('Fase')
title('DFT fase')
grid on
