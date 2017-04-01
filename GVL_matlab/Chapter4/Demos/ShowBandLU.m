  function ShowBandLU(A,p,q)
% function ShowBandLU(A,p,q)
% Illustrates band LU of a matrix A that has an LU factorization and
% lower bandwidth p and upper bandwidth q.
% A call of the form ShowBandLU() generates a random 7x7 example
% with lower bandwidth 2 and upper bandwidth 3.
if nargin==0
    p = 2;
    q = 3;
    L = triu(tril(randn(7,7)),-p);
    U = tril(triu(randn(7,7)),q);
    A = L*U;
end
[L,U] = BandLU(A,p,q);
clc
fprintf('Band LU\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('L = ')
fprintfM('%7.3f',L)
disp('U = ')
fprintfM('%7.3f',U)
fprintf('||A - LU|| = %10.3e\n',norm( A - L*U))