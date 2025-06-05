clc
clear

// base de flores (150x7)
// 0 - 50 -> classe 1
// 51 - 100 -> classe 2
// 101 - 150 -> classe 3
base = fscanMat('iris_log.dat');

// X -> vetores de entrada
X = base(:, 1:4); 
X = X';
X = [(-1)*ones(1, N);X];  //para o bias

// normalização zscore **nos atributos**
for i = 1:4
    X(i, :) = (X(:, i) - mean(X(i, :))) / stdev(X(i, :));
end

// classes do problema
D = base(:, 5:7);
D = D';

//mostragem dos dados
plot(x, y, '*');

// p -> qtd de atributos
// N -> qtd de amostras
[p N] = size(X);

// qtd de neurônios
Q = 10;

// Matriz que representa os centroides
// Cada valor é o centroide de um neurônio
// resultado -> vetores de 4 valores
C = rand(p, Q, 'normal');

sigma = 1;

// quantidade Q de neurônios ocultos por N colunas
Z = zeros(Q, N);

for i = 1:N
    for j = 1:Q
        // Função gaussiana
        v = norm(X(:, i) - C(:, j))
        
        // 10 linhas (valores) para cada amostra
        //Z(j, i) = exp(-v/(1/2)*sigma^2);
        Z(j, i) = exp(-(1/2)*v^2)  //para sigma==1
    end
end

// inclusão do bias
Zb = [(-1) * ones(1, N); Z];

// saída esperada (pontencia gerada)
// resultado -> (3X11) classes x neuronios+bias
//M = D * Zb' * (Zb * Zb')^(-1);
M = D * Zb' / (Zb * Zb')  //cálculo mais preciso da inversa

// teste
D_previsto = M * Zb(:, 1); //acerta a classe da 1° amostra?
D_previsto = M * Zb(:, 2); //acerta a classe da 2° amostra?

disp(D_previsto)








