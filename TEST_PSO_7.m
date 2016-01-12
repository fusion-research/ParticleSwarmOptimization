% TEST  --  PSO  -- Particle Swarm Optimization
%
% Test 7:  Styblinski-Tang function (5-D)  with noise
%
% There are many local minimums to this problem, but only one global
% minimum. All are of similar value. 
%   >> help StyblinskiTang   % For more details
%
% Try optimization on a noisy objective function
%

clc; clear; 

%%%% Set up problem

alpha = 0.01;  %noise variance -> 1 is on order of optimal objective
objFun = @(x)( StyblinskiTangNoise(x, alpha) );   % Minimize this function

xLow = -5*ones(5,1); % lower bound on the search space
xUpp = 5*ones(5,1); % upper bound on the search space
x0 = zeros(5,1);  % initial guess

options.alpha = 0.2;  % weight on current search direction
options.beta = 1.0;   % weight on local best search direction
options.gamma = 1.0;  % weight on global best search direction

options.nPopulation = 50;
options.maxIter = 20;

options.flagVectorize = true;

%%%% Solve
[xBest, fBest, info, dataLog] = PSO(objFun, x0, xLow, xUpp, options);

%%%% Analysis
figure(501); clf;
plotPsoHistory(info);


