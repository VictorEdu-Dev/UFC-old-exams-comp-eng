clear all
close all
clc

a = 0.5;
M = 10;
n = 0:M-1;

x = a.^n;
x = [zeros(1,M) x];
figure, stem(-M:(M-1),x,'.')

N = 10;
h = ones(1,N);
h = [zeros(1,M) h zeros(1,M)];
figure, stem(-M:N+M-1,h,'.')
y = conv(h,x);
figure, stem(0:length(y)-1,y,'.')

