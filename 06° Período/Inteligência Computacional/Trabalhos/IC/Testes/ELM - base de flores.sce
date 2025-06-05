// ELM - Extreme Learning Machine
// base de flores (150x7)
base = fscanMat('iris_log.dat');

// N = size(base)(2)
// qtd de amostras
// 0 - 50 -> classe 1
// 51 - 100 -> classe 2
// 101 - 150 -> classe 3
N = 150;

// X -> vetores de entrada
X = base(:, 1:4); 
X = X';
X = [(-1)*ones(1, N);X];  //para o bias

// classes do problema
D = base(:, 5:7);
D = D';

// p -> qtd de atr dos vet de entrada
p = 4

// q -> n° de neuronios ocultos
q = 10

// coluna extra para o bias
W = rand(q, p+1, 'normal'); //pesos da camada oculta

// ativação
Z = W * X;  // terá 150 linhas (qtd amostras) e 10 colunas (qtd neuronios)

// Z = 1./(1 + exp(-W * X)
// func logística
S = 1./(1 + exp(-Z);
S = [(-1)*ones(1, N);Z]; // bias

// M -> pesos da camada de saída  (classes, qtd neuronios ocultos +1) (lin, col)
M = D * S' * (S * S')^(-1);


vet_teste = X(:, 1);  // classe [1 0 0]

z_teste = 1./ (1 + exp(-W * vet_teste));

z_teste = [-1; z_teste]; // bias

classe_prevista = M * z_teste;





















