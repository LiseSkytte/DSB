clear
load '04746m';

N1 = length(val);
tlength = 10;
fsample = N1/tlength;
t1=[0:N1-1]/fsample;

y= fft(val, N1);

delta_f = fsample/N1;
f_axis = [0:delta_f:fsample-delta_f];

figure(1)
plot(t1,val)
xlabel('Tid i sekunder')
ylabel('Amplitude volt')
title('Plot af signalet')
grid on

figure(2)
plot(f_axis(1:0.5*end), abs((2/N1)*y(1:0.5*end)))
xlabel('Frekvens i Hz')
ylabel('Størrelse volt')
title('DFT størrelse magnitude')
grid on

figure(3)
semilogx(f_axis(1:0.5*end), abs((2/N1)*y(1:0.5*end)))
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


%%ZERO- PADDING  DET VIRKER, SKRIV DET
% %%
% P1 =4;
% x2 = [val zeros(1,(P1-1)*N1)];
% N2 = length(x2);
% 
% X2 = fft(x2,N2);
% delta_f = fsample/N2;
% f_axis = [0:delta_f:fsample-delta_f];
% plot(f_axis(1:0.5*end), P1*abs((2/N2)*X2(1:0.5*end)),'r')
% hold on

%%
% P2 =2;
% x3 = [val zeros(1,(P2-1)*N1)];
% N3= length(x3);
% 
% X3 = fft(x3,N3);
% delta_f = fsample/N3;
% f_axis = [0:delta_f:fsample-delta_f];
% plot(f_axis(1:0.5*end), P2*abs((2/N3)*X3(1:0.5*end)),'g')