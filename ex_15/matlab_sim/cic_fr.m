clc;
clear all;
R=32;
M=1;
N=6;

n=0:1:500-1;
w=pi*n/(length(n));
num=sin(R*M*w/2);
den=sin(w/2);
H=(num./den).^N;
ABS_H=abs(H);
mag=20*log10(ABS_H/max(ABS_H));
plot(w/pi,mag,'blue');
grid on;
axis([0,1,-280,0]);
