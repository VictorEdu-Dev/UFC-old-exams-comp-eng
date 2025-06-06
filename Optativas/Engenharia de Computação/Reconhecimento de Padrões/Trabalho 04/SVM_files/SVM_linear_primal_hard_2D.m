%% INIT

clc;
close;
clear;

% Obs: to make the problem unsolvable, just multiply both
%      variances (randn) by a factor of 2 or more

%% GENERATE SAMPLES

% Number of samples
N = 500;

% Samples for class 1
Xp = ones(N/2,1)*[1,1] + randn(N/2,2)*diag([0.2 0.1]);

% Samples for class 2
Xm = ones(N/2,1)*[1.5,-1] + randn(N/2,2)*diag([0.1 0.5]);

% All Samples
X = [Xp;Xm];

% Number of attributes
[~,p] = size(X);

% Scatter Plot
figure,  
plot(Xp(:,1),Xp(:,2),'bd')
hold on, 
plot(Xm(:,1),Xm(:,2),'ro')
grid on
axis([-2 2 -2 2])
hold off

% Class labels vector
y = [ones(N/2,1); -ones(N/2,1)]';

%% GENERATE LINEAR PROBLEM

% Add line of ones
X1 = [X,ones(N,1)];

% Quadratic Problem Formulation

H = eye(p+1);
H(p+1,p+1) = 0;

f = zeros(p+1,1);

Ain = -diag(y)*X1;

cin = -ones(N,1);

%% CALCULATE HYPERPLANE AND BIAS

% Optimization function
wb = quadprog(H,f,Ain,cin);

% Hyperplane weights and bias
w = wb(1:p);
b = wb(p+1);

%% ESTIMATION

% Estimated classes
y_est = sign(w'*X' + b);

% Error rate
error_rate = length(find(y~=y_est))/length(y);

%% GENERATE DECISION REGIONS

% Plot Data
figure,  
plot(Xp(:,1),Xp(:,2),'bd')
hold on, 
plot(Xm(:,1),Xm(:,2),'ro')
grid on
axis([-2 2 -2 2])

% Plot separation line
x1 = linspace(-2,2,20);
x2 = -w(1)/w(2)*x1 - b/w(2);
hold on,plot(x1,x2);

% Plot margin lines
hold on,plot(x1,x2-1/w(2));
hold on,plot(x1,x2+1/w(2));

%% END