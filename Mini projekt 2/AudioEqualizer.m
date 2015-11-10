clear 
[x, fsample]= wavread('Uptown');

x = x(fsample*92:fsample*102);

N = length(x);
N1 = 1000;

delta_f = fsample/N;
f_axis = [0:delta_f:fsample-delta_f];

%Lavpas
fc_LP = 4000;

%B�ndpas1
fc_BP1 =3900;
fc_BP11= 8800;

%B�ndpas2 
fc_BP2 = 8700;
fc_BP22 = 13200;

%B�ndpas3 
fc_BP3 = 13100;
fc_BP33 = 17600;

%H�jpas
fc_HP = 17500;


k1 = 1;
k2 = 1;
k3 = 1;
k4 = 1;
k5 = 1;

%%
%Filtre

%Lavpas
LP = fir1(N1, fc_LP/(0.5*fsample));

%H�jpas
HP = fir1(N1, fc_HP/(0.5*fsample), 'high');

%B�ndpas
BP1 = fir1(N1, [fc_BP1 fc_BP11]/(0.5*fsample), 'bandpass');
BP2 = fir1(N1, [fc_BP2 fc_BP22]/(0.5*fsample), 'bandpass');
BP3 = fir1(N1, [fc_BP3 fc_BP33]/(0.5*fsample), 'bandpass');

%%
%Filtrering


y_LP=conv(x,LP);
y_HP=conv(x,HP);
y_BP1=conv(x,BP1);
y_BP2=conv(x,BP2);
y_BP3=conv(x,BP3);

%%
%Samlede output for signalet
y_EQ = k1*y_LP + k2*y_HP + k3*y_BP1 + k4*y_BP2 + k5*y_BP3;

%Her kan man se, hvordan de forskellige filtre overlapper hinanden. 
%Det skal gerne v�re en lige streg, som man kan se nu.

figure(1)
freqz(LP)
hold on
freqz(BP1)
freqz(BP2)
freqz(BP3)
freqz(HP)

figure(2)
freqz(y_EQ)

%%
%FFT lavpas
X = fft(x, N);
LPf = fft(LP, N);
% Y_LPf = conv(X,LPf);


% 
% figure(3)
% semilogx(f_axis(1:0.5*end),20*log10(abs(2/N)*Y_LPf(1:0.5*end)))
% xlabel('Frekvens i Hz')
% ylabel('St�rrelse dB')

%FFT b�ndpas1
Y_BP1f = fft(BP1, N);

figure(4)
semilogx(f_axis(1:0.5*end),20*log10(abs(2/N)*Y_BP1f(1:0.5*end)))
xlabel('Frekvens i Hz')
ylabel('St�rrelse dB')

%FFT b�ndpas2
Y_BP2f = fft(BP2, N);

figure(5)
semilogx(f_axis(1:0.5*end),20*log10(abs(2/N)*Y_BP2f(1:0.5*end)))
xlabel('Frekvens i Hz')
ylabel('St�rrelse dB')

%FFT b�ndpas3
Y_BP3f = fft(BP3, N);

figure(6)
semilogx(f_axis(1:0.5*end),20*log10(abs(2/N)*Y_BP3f(1:0.5*end)))
xlabel('Frekvens i Hz')
ylabel('St�rrelse dB')

%FFT h�jpas
Y_HPf = fft(HP, N);

figure(7)
semilogx(f_axis(1:0.5*end),20*log10(abs(2/N)*Y_HPf(1:0.5*end)))
xlabel('Frekvens i Hz')
ylabel('St�rrelse dB')

%FFT samlede output 





% figure(2)
% semilogx(f_axis(1:0.5*end), 20*log10(abs((2/N1)*y_LP(1:0.5*end))))
% xlabel('Frekvens i Hz')
% ylabel('St�rrelse dB')
% title('DFT st�rrelse magnitude')
% grid on
% 
% 
% figure(3)
% plot(f_axis(1:0.5*end), unwrap(angle(y_LP(1:0.5*end)))) %Unwrap bruges til at l�gge faserne sammen
% xlabel('Frekvens i Hz')
% ylabel('Fase')
% title('DFT fase')
% grid on
% 
% 
% 
% 
