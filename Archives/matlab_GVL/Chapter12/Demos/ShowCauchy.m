  function ShowCauchy()
% function ShowCauchy()
% Checks out fast LU factorizations of a Cauchy-like matrix A that 
% satisfies 
%
%                  diag(omega)*A - A*diag(lambda) = RS' 
%
% where omega and lambda are column n-vectors and R and S are nxr.
% A call of the form ShowCauchy() sets A to be a 10-by-10 Cauchy-like
% matrix with displacement rank 3.
% GVL4: Section 12.1

% Generate an nxn random Cauchy-like matrix with that has
% displacement rank r...
n = 6; 
r = 3; 
R = randn(n,r); 
S = randn(n,r); 
omega = randn(n,1); 
lambda = randn(n,1); 
e = ones(n,1); 
% Form A explicitly and display its representation... 
A = (R*S').*(1./(omega*e' -e*lambda'));
clc
fprintf('LU Factorization of a Cauchy Matrix\n')
fprintf('\nomega  = ')
fprintfM('%10.3f',omega')
fprintf('lambda = ')
fprintfM('%10.3f',lambda')
fprintf('R'' = ')
fprintfM('%10.3f',R')
fprintf('S'' = ')
fprintfM('%10.3f',S')
fprintf('A = ')
fprintfM('%10.3f',A)

% LU  Without Pivoting...
[L,U] = LUdisp(omega,lambda,R,S);
fprintf('\nLU Without Pivoting...\n')
fprintf('\nL = ')
fprintfM('%10.3f',L)
fprintf('U = ')
fprintfM('%10.3f',U)
errA = norm(A-L*U);
fprintf('|| A - LU|| = %10.3e  (Algorithm 12.1.1)\n\n',errA)

% LU With Pivoting (Recursive Implementation)
[L,U,P] = LUdispPiv(omega,lambda,R,S);
fprintf('\nLU With Pivoting...\n')
fprintf('\nL = ')
fprintfM('%10.3f',L)
fprintf('U = ')
fprintfM('%10.3f',U)
fprintf('P = ')
fprintfM('%6.0f',P)
errA = norm(P*A-L*U);
fprintf('||PA - LU|| = %10.3e  (Algorithm 12.1.2)\n\n',errA)

% LU With Pivoting (Nonrecursive Implementation)
[L,U,P] = LUdispPivNonRecur(omega,lambda,R,S);
errA = norm(P*A-L*U);
fprintf('||PA - LU|| = %10.3e  (Nonrecursive Algorithm 12.1.2)\n\n',errA)
