clear all
% close all
clc

% [y,Fs]= audioread('botao.wav');
load train  
% y = y(:,1);
figure,plot(y)
tempo_vec = (1:length(y));
ylabel('Amplitude do Sinal')
xlabel('Tempo discreto')
% sound(y,Fs)
% sound(y,Fs)

% Transformada de Fourier
Yw = fftshift(fft(y));
freq_vec = linspace(-pi,pi,length(y));
figure,plot(freq_vec,abs(Yw),'b')
ylabel('Espectro de magnitude')
xlabel('Frquencia em Rad/s')
 
% freq_vec = linspace(-Fs/2,Fs/2,length(y));
% figure,plot(freq_vec,abs(Yw),'b')
% ylabel('Espectro de magnitude')
% xlabel('Frquencia de tempo contínuo em Hz')

% sound(y,Fs)


% Filtragem
wc1 = 0.5*pi;
[B,A] = butter(10, wc1/pi);
[H,W] = freqz(B,A,length(y));
figure,plot(W,abs(H))
y_filt = filter(B,A,y);
figure,plot(real(y_filt))
ylabel('Amplitude do Sinal Filtrado')
xlabel('Tempo discreto')
% axis([0 6e4 -1.1 1.1])
% sound(real(y_filt),Fs)
% zplane(B,A)


Yw_filt = fftshift(fft(y_filt));
freq_vec = linspace(-pi,pi,length(Yw_filt));
figure,plot(freq_vec,abs(Yw_filt))
ylabel('Espectro de magnitude do Sinal Filtrado')
xlabel('Frquencia em Rad/s')

