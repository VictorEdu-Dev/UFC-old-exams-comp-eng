clc
clear

//dados do problema
base = fscanfMat('aerogerador.dat');

//vel. do vento (independente)
x = base(:, 1);  x = x';
//potência gerada (dependente)
y = base(:, 2);  y = y';

//normalização (maior valor possível será 1
x = x./max(x);
y = y./max(y);

//mostragem dos dados
plot(x, y, '*');

// qtd de amostras
N = length(x);
 
// qtd de atributos do input (vel. do vento)
p = 1;

// qtd de neurônios
Q = 4;

// Matriz que representa os centroides
// Se tornará um vetor por causa de p
// Cada valor é o centroide de um neuronio
C = rand(p, Q, 'normal');

sigma = 1;

// quantidade Q de neurônios ocultos por N colunas
Z = zeros(Q, N);

for i = 1:N
    for j = 1:Q
        // Função gaussiana
        // a norma não será útil pq os valores são escalares
        v = norm(x(i) - C(j))
        
        // 10 linhas (valores) para cada amostra
        //Z(j, i) = exp(-v/(1/2)*sigma^2);
        Z(j, i) = exp(-(1/2)*v^2)  //para sigma==1
    end
end

// inclusão do bias
Zb = [(-1) * ones(1, N); Z];

// saída esperada (pontencia gerada)
// resultado -> 10 da qtd de neutonios e 1 do bias
//M = y * Zb' * (Zb * Zb')^(-1);
M = y * Zb' / (Zb * Zb')  //cálculo mais preciso da inversa

y_estimado = M * Zb;

plot(x, y_estimado, 'k-');

R2 = 1-sum((y-y_estimado).^2)/sum((y-mean(y)).^2);
















