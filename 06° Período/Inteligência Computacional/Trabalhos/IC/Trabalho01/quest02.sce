//dados do problema
base = fscanfMat('aerogerador.dat');

//vel. do vento (independente)
x = base(:, 1);
//potência gerada (dependente)
y = base(:, 2);

//mostragem dos dados
plot(x, y, '*');

//quantidade de amostras
n = length(x);

//vetor dos valores independentes
X = [ones(n, 1) x x.^2 x.^3 x.^4 x.^5 x.^6 x.^7];

// vetor dos valores de beta
// barra invertida para precisão de cálculo
beta = (X' * X) \ X' * y;

//Função de regressão múltipla
y_chap = beta(1) + beta(2) * x + beta(3) * x.^2 + beta(4) * x.^3 + beta(5) * x.^4 + beta(6) * x.^5 + beta(7) * x.^6 + beta(8) * x.^7;

plot(x, y_chap, 'r-');

// Erro de estimação (resíduo)
e = sum((y - y_chap)^2)

variancia = sum((y - y_chap)^2) / n - 2

// Coeficiente de determinação (variabilidade dos dados)
R2 = 1 - (sum((y - y_chap).^2)) / (sum((y - mean(y)).^2));

//-----

// Baseado na quantidade de termos que o modelo possui
[nr, nc] = size(X); //quantidade de linhas e colunas
k = nc - 1; //quantidade de termos
p = k + 1;

// Coeficiente de determinação ajustado
R2_aj = 1 - ((sum((y - y_chap).^2)) / (n - p)) / ((sum((y - mean(y)).^2)) / (n-1));




















