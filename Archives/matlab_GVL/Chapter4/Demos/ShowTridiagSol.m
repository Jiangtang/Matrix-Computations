  function ShowTridiagSol()
% function ShowTridiagSol()
% Demonstrates TridiagSol on a random example.
n = 7;
alfa =  3+rand(n,1);
beta = -1+2*rand(n-1,1);
b = randn(n,1);
x = TridiagSol(alfa,beta,b);
A = diag(beta,-1)+diag(alfa)+diag(beta,1);
clc
fprintf('Symmetric Positive Definite Tridiagonal System Solver\n\n')
disp('A =')
fprintfM('%7.3f',A)
x0 = A\b;
err = norm(x-x0);
fprintf('||x - A\\b|| = %10.3e\n\n',err)


