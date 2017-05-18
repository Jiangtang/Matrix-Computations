  function ShowGaxpyLU(A)
% function ShowGaxpyLU(A)
% Displays the factorization A = LU computed via Gaxpy LU.
% A call of the form ShowGaxpyLU() sets A to be a random 5x5 example.
if nargin==0
    A = randn(5,5);
end
clc
[L,U] = GaxpyLU(A);
fprintf('Gaxpy LU\n')
disp('A = '), fprintfM('%11.6f',A)
disp('L = '), fprintfM('%11.6f',L)
disp('U = '), fprintfM('%11.6f',U)
fprintf('||A - LU|| = %20.15e\n',norm(A -L*U))