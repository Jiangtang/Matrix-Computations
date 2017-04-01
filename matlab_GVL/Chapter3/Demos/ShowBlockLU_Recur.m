  function ShowBlockLU_Recur(A,r)
% function ShowBlockLURecur(A,r)
% Displays the factorization A = LU computed via recursive block LU
% where A is square and r is the blocking parameter.
% A call of the form ShowBlockLU_Recur() sets A to be a random 6x6 example
% and uses r = 2;
if nargin==0
    A = randn(6,6);
    r = 2;
end
clc
[L,U] = BlockLU_Recur(A,r);
fprintf('Recursive Block LU\n')
disp('A = '), fprintfM('%11.6f',A)
disp('L = '), fprintfM('%11.6f',L)
disp('U = '), fprintfM('%11.6f',U)
fprintf('||A - LU|| = %20.15e\n',norm(A -L*U))