clear 
[x, fsample]= wavread('Uptown');

x = x(fsample*92:fsample*102);

N = length(x);

fc_LP = 4000;
fc_BP1 =8000;
fc_BP2= 12000;
fc_HP = 16000;

N1 = 1000;

k1 = 1;
k2 = 1;
k3 = 1;
k4 = 1;
k5 = 1;

%%
%Filtre

%Lavpas
LP = fir1(N1, fc_LP/(0.5*fsample));

%Højpas
HP = fir1(N1, fc_HP/(0.5*fsample), 'high');

%Båndpas
BP1 = fir1(N1, [fc_LP fc_BP1]/(0.5*fsample), 'bandpass');
BP2 = fir1(N1, [fc_BP1 fc_BP2]/(0.5*fsample), 'bandpass');
BP3 = fir1(N1, [fc_BP2 fc_HP]/(0.5*fsample), 'bandpass');

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


figure(1)
freqz(LP)
hold on
freqz(BP1, 'r')

[h,W]=freqz(BP1);



% delta_f = fsample/N1;
% f_axis = [0:delta_f:fsample-delta_f];





% figure(2)
% semilogx(f_axis(1:0.5*end), 20*log10(abs((2/N1)*y_LP(1:0.5*end))))
% xlabel('Frekvens i Hz')
% ylabel('Størrelse dB')
% title('DFT størrelse magnitude')
% grid on
% 
% 
% figure(3)
% plot(f_axis(1:0.5*end), unwrap(angle(y_LP(1:0.5*end)))) %Unwrap bruges til at lægge faserne sammen
% xlabel('Frekvens i Hz')
% ylabel('Fase')
% title('DFT fase')
% grid on
% 
% 
% 
% 
