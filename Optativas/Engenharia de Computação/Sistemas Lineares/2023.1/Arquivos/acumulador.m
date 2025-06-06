clc
clear all
close all

% Calcular a saída de um sistema acumulador para entradas que são nulas
% para n < 0. Esta rotina serve para ilustrar o conceito de estabilidade

N = 50;       % Número de mostras do sinal de entrada
x = ones(N,1);   % Sinal de entrada igual a 1, com N pontos
x = (1/2).^(0:N-1); % Sinal de entrada igual a exponencial decrescente, com N pontos

% Cálculo do sinal de saída
for i = 1:N
    y(i) = sum(x(1:i));
end
figure,plot(x)
figure,plot(y)
% figure,stem(y,'.')