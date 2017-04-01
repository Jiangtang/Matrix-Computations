  function ShowOuterLU(A)
% function ShowOuterLU(A)
% Displays the factorization A = LU computed via outer product LU.
% A call of the form ShowOuterLU() sets A to be a random 5x5 example.
if nargin==0
    A = randn(5,5);
end
clc
[L,U] = OuterLU(A);
fprintf('Outer Product LU\n')
disp('A = '), fprintfM('%11.6f',A)
disp('L = '), fprintfM('%11.6f',L)
disp('U = '), fprintfM('%11.6f',U)
fprintf('||A - LU|| = %20.15e\n',norm(A -L*U))