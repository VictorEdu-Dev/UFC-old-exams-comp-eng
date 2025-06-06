
%% HYPERPARAMETERS

% Regularization Parameter
C = 0.1; % C = 10; % C = 1000;

% Polynomial kernel order
d = 4; 


% Polinomial kernel
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

% Optimization problem
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
for j = 1:length(sv)
    aux = aux + y(sv(j))*alphas(sv(j))*K(sv(j),:);
end
y_est = sign(aux + b).';

% Error rate
error_rate = length(find(y~=y_est))/length(y);

%% GENERATE DECISION BOUNDARIES

% Generate matrix of test from 2D rectanguar grid
u = linspace(-2,2,100).';
U = [kron(u,ones(length(u),1)).'; kron(ones(length(u),1),u).'];

% Decision classes for the grid
Ku = (X(:,sv).'*U + 1).^d;
aux = zeros(1,length(u)^2);
for j = 1:length(sv)
    aux = aux + y(sv(j))*alphas(sv(j))*Ku(j,:);
end
y_est_grid = sign(aux + b).';

% Plot decision regions at original space
for j = 1:length(u)
    for i = 1:length(u)
        if y_est_grid((j-1)*length(u) + i) == 1
            hold on,plot(u(j),u(i),'.k')
        else
             hold on,plot(u(j),u(i),'.g')
        end
    end
end

%% END