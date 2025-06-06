clear all
close all
clc

% Sinal de entrada: 
%  x[n] = (1/2)^n, para 0 <= n <= 5
%  x[n] = 0, caso contrário
% x = [(1/2).^(0:5)];
x = [0 0 1 1 1 1 1 0 0 0];
figure, stem(0:9,x,'.r','LineWidth',2)
ylabel('Sinal de entrada x[k]')
xlabel('Variavel k')
axis([-10 10 -1.1 1.1])
grid on



% Resposta ao impulso:
%  h[n] = -1, para 0 <= n <= 3
%  h[n] = 1, para 4 <= n <= 7
% h = [-ones(1,4) ones(1,4)];
h = [1 1 1 0 0 0 0 0 0 0];
figure, stem(0:9,h,'.','LineWidth',2)
ylabel('Resposta ao Impulso h[k]')
xlabel('Variavel k')
axis([-10 10 -1.1 1.1])
grid on


% Grafico de h[-k] em função de k
figure, stem(0:-1:-9,h,'.','LineWidth',2)
ylabel('RI Espelhada h[-k]')
xlabel('Variavel k')
axis([-10 10 -1.1 1.1])
grid on

 close all
% Convolução para alguns valores de n
for n = -5:12
    % Graficos de h[n-k] e x[k] em função de k
    figure, stem((0:-1:-9)+n,h,'d','LineWidth',1)
    hold on, stem(0:9,x,'r-.','LineWidth',1)
    legend('h[n-k]','x[k]')
    xlabel('Variavel k')
    title(['n=' num2str(n)] )
    axis([-10 10 -1.1 1.1])
    grid on

    % Sinal de Saída
    if n >= 0
        y(n+1) = 0;
        for k = 0:5
            if n-k>=0 & n-k<=7
                y(n+1) = y(n+1) + x(k+1)*h(n-k+1);
            end
        end
%         hold on, stem(0:length(y)-1,y,'d:k','LineWidth',1)
%         legend('h[n-k]','x[k]','y[n]')
%         title(['n=' num2str(n)] )
%         axis([-10 15 -2.1 3.1])
        
    end
pause
close all
end
y2 = conv(x,h);
hold on, stem(0:length(y2)-1,y2,'.g','LineWidth',2)