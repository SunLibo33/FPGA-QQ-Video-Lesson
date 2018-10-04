clc;
clear all;
fs=50e6;
f1=1e3;
f2=10e3;
n=0:204700;

s_1=sin(2*pi*n*f1/fs);
s_2=sin(2*pi*n*f2/fs);
s_12=s_1.*s_2;
fft_out=fft(s_12,2048);
fft_abs=abs(fft_out);


