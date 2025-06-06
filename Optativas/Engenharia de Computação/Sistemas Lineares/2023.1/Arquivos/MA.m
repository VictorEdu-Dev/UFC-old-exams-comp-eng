clc
clear all
close all

x1 = (1:100) + 5*randn(1,100);
x2 = 100*ones(1,100) + 5*randn(1,100);
x = [x1 x2];
figure,plot(x,'LineWidth',2)
M2 = 30;
for n = M2+1:200
    y(n) = mean(x(n-M2:n));
end
hold on,plot(y,'r','LineWidth',2)