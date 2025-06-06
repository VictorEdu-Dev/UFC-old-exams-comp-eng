%% INIT

clc;
close;
clear;

%% HYPERPARAMETERS

% Regularization Parameter
C = 0.1; % C = 10; % C = 1000; 

% Polynomial kernel order
d = 2;

%% GENERATE SAMPLES

% Number of samples
N = 500;

% Samples for class 1
Xp = [1; 1; 1]*ones(1,N/2) + diag([0.2 0.1 0.3])*randn(3,N/2);

% Samples for class 2
Xm = [1.5; -1; 0.5]*ones(1,N/2) + diag([0.1 0.5 0.1])*randn(3,N/2);

% All Samples
X = [Xp Xm];

% Scatter Plot
figure,  
plot3(Xp(1,:),Xp(2,:),Xp(3,:),'bd')
hold on, 
plot3(Xm(1,:),Xm(2,:),Xm(3,:),'ro')
grid on
axis([-2 2 -2 2 -2 2])
hold off

% Class labels vector
y = [ones(N/2,1); -ones(N/2,1)];

%% GENERATE (NON LINEAR) QUADRATIC PROBLEM

% Kernel Matrix
K = (X.'*X + 1).^d;

% Quadratic Programming Modeling

H = diag(y)*K*diag(y);
f = -ones(N,1);

Ain = -eye(N);
cin = zeros(N,1);

Aeq = y.';
beq = 0;

lb = zeros(N,1);        % Minimum values for SV (Lagrange Multipliers)
ub = C*ones(N,1);       % Maximum values for SV (Lagrande Multipliers)
x0 = [];                % Dosen't indicate a initial value for alphas

opt = optimoptions(@quadprog,'Algorithm', ...
                       'interior-point-convex','Display','off');

%% CALCULATE LAGRANGE MULTIPLIERS AND BIAS

% Optimization Problem
alphas = quadprog(H,f,Ain,cin,Aeq,beq,lb,ub,x0,opt);

% Support Vectors
sv = find(alphas > 1e-6);

% Bias
b = 0;
for i = 1:length(sv)
    b = b + 1/y(sv(i));
    for j = 1:length(sv)
          b = b - y(sv(j))*alphas(sv(j))*K(sv(j),sv(i));
    end
end
b = b/length(sv);

%% ESTIMATION

% Estimated classes
aux = zeros(1,N);
for i = 1:length(sv)
    aux = aux + y(sv(i))*alphas(sv(i))*K(sv(i),:);
end
y_est = sign(aux + b).';

% Error rate
error_rate = length(find(y~=y_est))/length(y);

%% GENERATE DECISION REGIONS



%% END