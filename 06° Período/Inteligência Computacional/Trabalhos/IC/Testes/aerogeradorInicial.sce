//dados do problema
base = fscanfMat('aerogerador.dat');

//vel. do vento (independente)
x = base(:, 1);
//potência gerada (dependente)
y = base(:, 2);

//quantidade de amostras
n = length(x);

//plot(x, y, '*');

beta_1 = (sum(y.*x) - (1/n) * sum(y) * sum(x)) / (sum(x.^2) - (1/n) * sum(x)^2);

beta_0 = mean(y) - beta_1 * mean(x);

//Reta de regressão
y_chap = beta_1 * x + beta_0;

plot(x, y_chap, 'k-');

// Erro de estimação (resíduo)
e = sum((y - y_chap)^2)

variancia = sum((y - y_chap)^2) / n - 2

// Coeficiente de determinação (variabilidade dos dados)
R2 = 1 - (sum((y - y_chap).^2))/(sum((y - mean(y)).^2))
