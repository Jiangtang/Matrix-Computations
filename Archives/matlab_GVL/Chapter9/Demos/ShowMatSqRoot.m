  function ShowMatSqRootn()
% function ShowMatSqRoot()
% Illustrates convergence of two methods for the matrix square root.
% GVL4: Section 9.4.2
n = 20;           % size of matrix
nStepsMax = 15;   % maximum number of steps
A = triu(randn(n,n));
for k=1:n
    A(k,k) = abs(A(k,k));
end
for k = 1:nStepsMax;
    X_Newton = Newton(A,k);
    errN(k) = norm(A - X_Newton*X_Newton);
    X_DB = DenmanBeavers(A,k);
    errDB(k) = norm(A - X_DB*X_DB);
end
semilogy(1:nStepsMax,errN,1:nStepsMax,errDB,'r')
xlabel('iteration','fontsize',14)
title(sprintf('Matrix Square Root Methods: n = %3d, ||A||_2 = %10.2e',n,norm(A)),'fontsize',14)
ylabel('|| A - X^2 ||_2','fontsize',14)
legend('Newton','Denman-Beavers')
set(gcf,'position',[200 200 800 600])
shg

  function X = Newton(A,nSteps)
% function X = Newton(A,nSteps)
% Matrix square root function based on nSteps of the Newton iteration.
% A is real nxn and X is approximately sqrt(A).
% GVL4: Section 9.4.2.
X = A;
for k=0:nSteps-1
    X = (X + X\A)/2;
end

  function X = DenmanBeavers(A,nSteps)
n = length(A);
X = A; 
Y = eye(n,n);
for k = 0:nSteps-1
    Xk = X;
    Yk = Y;
    X = (Xk + inv(Yk))/2;
    Y = (Yk + inv(Xk))/2;
end
          
          
          
          