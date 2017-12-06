clc
clear all
%% init
Am=1; Ac=1;
fc=10000;fm=1000;fs=40*1000;Tp=0.01;
dt=1/fs;df=1/Tp;
wm=2*pi*fm;wc=2*pi*fc;

t=0:dt:(Tp-dt);
mt=Am*sin(wm.*t);
mc=Ac*cos(wc.*t);
%% m(t) c(t)
subplot(2,1,1)
plot(t,mt);title('�����ź�');
subplot(2,1,2)
plot(t,mc);title('�ز��ź�');
%% DSB AM
figure
subplot(2,1,1)
s_DSB=mt.*mc;
plot(t,s_DSB);title('DSB�ź�');
hold on;plot(t,abs(mt),'r');hold off;
subplot(2,1,2)
s_AM=(1+mt).*mc;
plot(t,s_AM);title('AM�ź�');
hold on;plot(t,mt+1,'r');hold off;
%% SSB
figure
s_SSB_up=1/2*mt.*mc;
s_SSB_down=1/2*sin(wm.*t).*sin(wc.*t);
subplot(2,1,1)
plot(t,s_SSB_up-s_SSB_down);title('SSB�ϱߴ�');
hold on;plot(t,abs(mt)/2,'r');hold off;
subplot(2,1,2)
plot(t,s_SSB_up+s_SSB_down);title('SSB�±ߴ�');
hold on;plot(t,abs(mt)/2,'r');hold off;
%% FT
figure
N=2^12;
n=0:N-1;
% fs=100*1000;
% m(t)
subplot(2,2,1)
fft_mt=fft(mt,N);
plot(n/N*fs,abs(fft_mt));xlim([0 20*1000]);
title('�����ź�FFT������');
subplot(2,2,2)
plot(n/N*fs,angle(fft_mt));xlim([0 2000]);
title('�����ź�FFTƵ����');
% c(t)
subplot(2,2,3)
fft_mc=fft(mc,N);
plot(n/N*fs,abs(fft_mc));xlim([0 20*1000]);
title('�ز��ź�FFT������');
subplot(2,2,4)
plot(n/N*fs,angle(fft_mc));xlim([0 2000]);
title('�ز��ź�FFTƵ����');
%AM
figure
subplot(1,2,1)
fft_s_AM=fft(s_AM,N);
plot(n/N*fs,abs(fft_s_AM));xlim([0 20*1000]);
title('AM�ź�FFT������');
subplot(1,2,2)
plot(n/N*fs,angle(fft_s_AM));xlim([0 2000]);
title('AM�ź�FFTƵ����');
%DSB
figure
subplot(1,2,1)
fft_s_DSB=fft(s_DSB,N);
plot(n/N*fs,abs(fft_s_DSB));xlim([0 20*1000]);
title('DSB�ź�FFT������');
subplot(1,2,2)
plot(n/N*fs,angle(fft_s_DSB));xlim([0 2000]);
title('DSB�ź�FFTƵ����');
%SSB_up
figure
subplot(1,2,1)
fft_s_SSB_u=fft(s_SSB_up-s_SSB_down,N);
plot(n/N*fs,abs(fft_s_SSB_u));xlim([0 20*1000]);
title('SSB�ϱߴ��ź�FFT������');
subplot(1,2,2)
plot(n/N*fs,angle(fft_s_SSB_u));xlim([0 2000]);
title('SSB�ϱߴ��ź�FFTƵ����');
%SSB_down
figure
subplot(1,2,1)
fft_s_SSB_d=fft(s_SSB_up+s_SSB_down,N);
plot(n/N*fs,abs(fft_s_SSB_d));xlim([0 20*1000]);
title('SSB�±ߴ��ź�FFT������');
subplot(1,2,2)
plot(n/N*fs,angle(fft_s_SSB_d));xlim([0 2000]);
title('SSB�±ߴ��ź�FFTƵ����');