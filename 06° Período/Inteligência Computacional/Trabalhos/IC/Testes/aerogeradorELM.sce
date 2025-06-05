clear
clc

// dados do problema
base = fscanfMat('aerogerador.dat');

// vel. do vento (independente)
x = base(:, 1); x = x';
// potência gerada (dependente)
y = base(:, 2); y = y';

// qtd de amostras
N = length(x);

// bias
X = [(-1)*ones(1, N); x];

//mostragem dos dados
plot(x, y, '*');

// qtd de neurônios ocultos
q = 7;

// dimensão do vetor de entrada
p = 1;

// pesos aleatórios dos neurônios ocultos da ELM
W = rand (q, p+1, 'normal');

// função de ativação
Z = 1./ (1+ exp(-W * X));
// bias
Z = [(-1)*ones(1, N); Z];

// pesos da camada de saída
// dimensão - (c, q+1) classes e neurônios ocultos+1
// M = y * Z' * (Z * Z')^(-1);

M = y * Z' / (Z * Z');

y_estim = M * Z;

plot(x, y_estim, 'k-');

R2 = 1-sum((y-y_estim).^2) / sum((y-mean(y)).^2);

title(string(R2));














