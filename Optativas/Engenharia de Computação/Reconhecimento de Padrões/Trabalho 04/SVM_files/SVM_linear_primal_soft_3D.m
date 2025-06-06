%% INIT

clc;
close;
clear;

%% HYPERPARAMETERS

% Regularization Parameter
C = 1000; % C = 10

%% GENERATE SAMPLES

% Number of samples
N = 500;

% Samples for class 1
Xp = ones(N/2,1)*[1,1,1] + randn(N/2,3)*diag([0.2 0.1 0.3])*2;

% Samples for class 2
Xm = ones(N/2,1)*[1.5,-1,0.5] + randn(N/2,3)*diag([0.1 0.5 0.2])*2;

% All Samples
X = [Xp;Xm];

% Number of attributes
[~,p] = size(X);

% Scatter Plot
figure,  
plot3(Xp(:,1),Xp(:,2),Xp(:,3),'bd')
hold on, 
plot3(Xm(:,1),Xm(:,2),Xm(:,3),'ro')
grid on
axis([-2 2 -2 2 -2 2])
hold off

% Classe labels Vector
y = [ones(N/2,1); -ones(N/2,1)]';

%% GENERATE LINEAR PROBLEM

% Add line of ones
X1 = [X,ones(N,1)];

% Quadratic Programming Modeling

H = zeros(p+1+N);
H(1:p,1:p) = eye(p);

f = [zeros(p+1,1); C*ones(N,1)];

Ain1 = zeros(N,p+1+N);
Ain1(:,1:p+1) = -diag(y)*X1;
Ain1(:,p+2:p+1+N) = -eye(N);

cin1 = -ones(N,1);

Ain2 = -eye(N+p+1);
Ain2(1:p+1,1:p+1) = zeros(p+1);

cin2 = zeros(N+p+1,1);

Ain = [Ain1; Ain2];

cin = [cin1; cin2]; 

%% CALCULATE HYPERPLANE AND BIAS

% Optimization function
wb = quadprog(H,f,Ain,cin);

% Hyperplane weight and bias values
w = wb(1:p);
b = wb(p+1);

%% ESTIMATION

% Estimated classes
y_est = sign(w'*X' + b);

% Error rate
error_rate = length(find(y~=y_est))/length(y);

%% GENERATE DECISION REGIONS

% Plot data
figure,  
plot3(Xp(:,1),Xp(:,2),Xp(:,3),'bd')
hold on, 
plot3(Xm(:,1),Xm(:,2),Xm(:,3),'ro')
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