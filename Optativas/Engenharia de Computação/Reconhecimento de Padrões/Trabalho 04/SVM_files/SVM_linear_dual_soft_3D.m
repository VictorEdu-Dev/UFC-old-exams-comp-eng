%% INIT

clc;
close;
clear;

%% HYPERPARAMETERS

% Regularization Parameter
C = 1000; % C = 10; % C = 0.1;

%% GENERATE SAMPLES

% Number of samples
N = 1000;

% Samples for class 1
Xp = [1; 1; 1]*ones(1,N/2) + diag([0.2 0.1 0.3])*randn(3,N/2)*3;

% Samples for class 2
Xm = [1.5; -1; 0.5]*ones(1,N/2) + diag([0.1 0.5 0.2])*randn(3,N/2)*3;

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

% Class labels Vector
y = [ones(N/2,1); -ones(N/2,1)];

%% GENERATE LINEAR PROBLEM

% Generate dot product matrix
K = (X.'*X);

% Quadratic Problem Formulation

H = diag(y)*K*diag(y);
f = -ones(N,1);

Ain = -eye(N);
cin = zeros(N,1);

Aeq = y.';
ceq = 0;

lb = zeros(N,1);        % Minimum values for SV (Lagrange Multipliers)
ub = C*ones(N,1);       % Maximum values for SV (Lagrande Multipliers)
x0 = [];                % Dosen't indicate a initial value for alphas

opt = optimoptions(@quadprog,'Algorithm', ...
                       'interior-point-convex','Display','off');

%% CALCULATE LAGRANGE MULTIPLIERS, HYPERPLANE AND BIAS

% Optimization function
alpha = quadprog(H,f,Ain,cin,Aeq,ceq,lb,ub,x0,opt);

% Hyperplane Weights
w = sum(X*diag(y)*diag(alpha),2);

% Support Vectors
sv = find(alpha > 1e-6);

% Bias
b = 0;
for i = 1:length(sv)
    b = b + 1/y(sv(i)) - w'*X(:,sv(i));
end
b = b/length(sv);

%% ESTIMATION

% Estimated classes
y_est = sign(w'*X + b)';

% Error rate
error_rate = length(find(y~=y_est))/length(y);

%% GENERATE DECISION REGIONS

% Plot data
figure,  
plot3(Xp(1,:),Xp(2,:),Xp(3,:),'bd')
hold on, 
plot3(Xm(1,:),Xm(2,:),Xm(3,:),'ro')
grid on
axis([-2 2 -2 2 -2 2])

% Plot separation plane
[x1,x2] = meshgrid(-2:1:2);
x3 = -w(1)/w(3)*x1 -w(2)/w(3)*x2 - b/w(3);
hold on,surf(x1,x2,x3);

% Plot margin planes
hold on,surf(x1,x2,x3-1/w(3));
hold on,surf(x1,x2,x3+1/w(3));

%% END