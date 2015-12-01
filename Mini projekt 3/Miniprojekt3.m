clear;
[x,fsample] = audioread('Tale.wma');

[z, fsample2] = audioread('TaleSkældud.wma');

x1 = x(:,1)';
z1 = z(:,1)';

X1 = x1(fsample*0.1:fsample*10.1);
X2 = x1(fsample*10.1:fsample*20.1);
X3 = x1(fsample*20.1:fsample*30.1);
X4 = x1(fsample*30.1:fsample*40.1);
X5 = x1(fsample*40.1:fsample*50.1);
X6 = x1(fsample*50.1:fsample*60.1);
Z1 = z1(fsample*0.1:fsample*10.1);

N1 = length(X1);
N2 = length(x1);
% tlength = N1/fsample;
t1=[0:N1-1]/fsample;
t2=[0:N2-1]/fsample;

delta_f = fsample/N1;
f_axis = [0:delta_f:fsample-delta_f];

figure(1)
plot(t2,x1)
grid on
xlabel('Tid i sekunder')
ylabel('Amplitude volt')
title('Plot af hele signalet')

figure(20)
plot(t1,X1)
grid on 
xlabel('Tid i sekunder')
ylabel('Amplitude volt')
title('Plot af det første interval')

figure(2)
plot(t1,X1,'r')
hold on
plot(t1+10,X2, 'g')
plot(t1+20, X3, 'b')
plot(t1+30, X4, 'y')
plot(t1+40, X5, 'black')
plot(t1+50, X6, 'm')
grid on
xlabel('Tid i sekunder')
ylabel('Amplitude volt')
title('Plot af interval delt signal')

figure(3)
plot(t1,Z1)
grid on
xlabel('Tid i sekunder')
ylabel('Amplitude volt')
title('Plot af tale 2 signal')
% 
% y1 = fft(X1,N1);
% y2 = fft(X2,N1);
% y3 = fft(X3,N1);
% y4 = fft(X4,N1);
% y5 = fft(X5,N1);
% y6 = fft(X6,N1);
% y7 = fft(Z1,N1);
% % y_samlet = y1 + y2 + y3 + y4 + y5 + y6;
% 
% figure(4)
% semilogx(f_axis(1:0.5*end),20*log10(abs(2/N1)*y1(1:0.5*end)))
% title('FFT af første interval')
% xlabel('Frekvens i Hz')
% ylabel('Størrelse dB')
% grid on
% 
% figure(5)
% plot(f_axis(1:0.5*end), unwrap(angle(y1(1:0.5*end)))) %Unwrap bruges til at lægge faserne sammen
% title('FFT af første interval')
% xlabel('Frekvens i Hz')
% ylabel('Fase')
% grid on
% 
% figure(6)
% semilogx(f_axis(1:0.5*end),20*log10(abs(2/N1)*y2(1:0.5*end)))
% title('FFT af andet interval')
% xlabel('Frekvens i Hz')
% ylabel('Størrelse dB')
% grid on
% 
% figure(7)
% plot(f_axis(1:0.5*end), unwrap(angle(y2(1:0.5*end)))) %Unwrap bruges til at lægge faserne sammen
% title('FFT af andet interval')
% xlabel('Frekvens i Hz')
% ylabel('Fase')
% grid on
% 
% figure(8)
% semilogx(f_axis(1:0.5*end),20*log10(abs(2/N1)*y3(1:0.5*end)))
% title('FFT af tredje interval')
% xlabel('Frekvens i Hz')
% ylabel('Størrelse dB')
% grid on
% 
% figure(9)
% plot(f_axis(1:0.5*end), unwrap(angle(y3(1:0.5*end)))) %Unwrap bruges til at lægge faserne sammen
% title('FFT af tredje interval')
% xlabel('Frekvens i Hz')
% ylabel('Fase')
% grid on
% 
% figure(10)
% semilogx(f_axis(1:0.5*end),20*log10(abs(2/N1)*y4(1:0.5*end)))
% title('FFT af fjerde interval')
% xlabel('Frekvens i Hz')
% ylabel('Størrelse dB')
% grid on
% 
% figure(11)
% plot(f_axis(1:0.5*end), unwrap(angle(y4(1:0.5*end)))) %Unwrap bruges til at lægge faserne sammen
% title('FFT af fjerde interval')
% xlabel('Frekvens i Hz')
% ylabel('Fase')
% grid on
% 
% figure(12)
% semilogx(f_axis(1:0.5*end),20*log10(abs(2/N1)*y5(1:0.5*end)))
% title('FFT af femte interval')
% xlabel('Frekvens i Hz')
% ylabel('Størrelse dB')
% grid on
% 
% figure(13)
% plot(f_axis(1:0.5*end), unwrap(angle(y5(1:0.5*end)))) %Unwrap bruges til at lægge faserne sammen
% title('FFT af femte interval')
% xlabel('Frekvens i Hz')
% ylabel('Fase')
% grid on
% 
% figure(14)
% semilogx(f_axis(1:0.5*end),20*log10(abs(2/N1)*y6(1:0.5*end)))
% title('FFT af sjette interval')
% xlabel('Frekvens i Hz')
% ylabel('Størrelse dB')
% grid on
% 
% figure(15)
% plot(f_axis(1:0.5*end), unwrap(angle(y6(1:0.5*end)))) %Unwrap bruges til at lægge faserne sammen
% title('FFT af sjette interval')
% xlabel('Frekvens i Hz')
% ylabel('Fase')
% grid on
% 
% figure(16)
% semilogx(f_axis(1:0.5*end),20*log10(abs(2/N1)*y7(1:0.5*end)))
% title('FFT af tale 2')
% xlabel('Frekvens i Hz')
% ylabel('Størrelse dB')
% grid on
% 
% figure(17)
% plot(f_axis(1:0.5*end), unwrap(angle(y7(1:0.5*end)))) %Unwrap bruges til at lægge faserne sammen
% title('FFT af tale 2')
% xlabel('Frekvens i Hz')
% ylabel('Fase')
% grid on

%%
%%Lavpasfilter
fc_LP = 500;
LP = fir1(1000, fc_LP/(0.5*fsample));

y_LP = filter(LP,1,X1);
z_LP = filter(LP,1,Z1);

figure(18)
plot(t1, X1)
title('Plot af første tidsinterval')
xlabel('Tid i sekunder')
ylabel('Amplitude volt')
grid on

figure(19)
plot(t1,y_LP)
title('Plot af første tidsnterval efter lavpasfiltrering')
xlabel('Tid i sekunder')
ylabel('Amplitude volt')
grid on

soundsc(y_LP,fsample)
pause
soundsc(z_LP,fsample)

%%

