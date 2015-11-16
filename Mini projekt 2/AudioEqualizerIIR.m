clear
[x, fsample]= wavread('Uptown');

x = x(fsample*92:fsample*108);

N = length(x);
N1 = 6;

%soundsc(x, fsample);
