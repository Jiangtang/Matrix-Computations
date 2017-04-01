  function ShowJacobi()
% function ShowJacobi()
% Illustrates the convergence of both the classical and cyclic
% Jacobi methods for computing the symmetric Schur decomposition.
% GVL4: Section 8.5

close all
n = 20; A = randn(n,n); A = A + A'; 
tol = 10^(-8);
% Classical...
[V,D,offVals] = JacobiClassical(A,tol);
m = length(offVals);
semilogy((1:m),offVals)
ylabel('off(A)','fontsize',14)
xlabel('Updates','fontsize',14)
title(sprintf('Classical Jacobi   n=%1d   tol=%10.3e   updates = %1d',n,tol,m),'fontsize',14)
% Cyclic...
figure
[V,D,offVals] = JacobiCyclic(A,tol);
m = length(offVals);
semilogy((1:m),offVals)
ylabel('off(A)','fontsize',14)
xlabel('Updates','fontsize',14)
title(sprintf('Cyclic Jacobi   n=%1d   tol=%10.3e   updates = %1d',n,tol,m),'fontsize',14)