  function ShowMatrixSign()
% function ShowMatrixSign()
% Illustrates convergence of Newton's method for the matrix sign function.
% GVL4: Section 9.4.1
n = 100;          % size of matrix
scale = 1000;     % norm(A) roughly scale*sqrt(n)
nStepsMax = 50;   % maximum number of Newton steps
A = scale*randn(n,n);
S_Def = signM(A);
for k = 1:nStepsMax;
    S_Newton = Newton(A,k);
    err(k) = norm(S_Def-S_Newton);
end
semilogy(1:nStepsMax,err)
xlabel('iteration','fontsize',14)
title(sprintf('Matrix Sign Function via Newton: n = %3d, ||A||_2 = %10.2e',n,norm(A)),'fontsize',14)
ylabel(sprintf('|| error ||_{2}'),'fontsize',14)
set(gcf,'position',[200 200 800 600])
shg

  function S = Newton(A,nSteps)
% function S = Newton(A,nSteps)
% Matrix sign function based on nSteps of the Newton iteration.
% A is real nxn and S is approximately sign(A).
% GVL4: Section 9.4.1.
S = A;
for k=0:nSteps-1
    S = (S + inv(S))/2;
end

  function S = signM(A)
% function S = signM(A)
% Matrix sign function based on definition.
% A is real nxn and S = sign(A).
% GVL4: Section 9.4.1
n = length(A);
S = zeros(n,n);
[X,D] = eig(A);
Y = inv(X)';
for k=1:n
    if real(D(k,k))< 0 
        S = S - X(:,k)*Y(:,k)';
    else
        S = S + X(:,k)*Y(:,k)';
    end
end
S = real(S);