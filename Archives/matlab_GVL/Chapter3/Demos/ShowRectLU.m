  function ShowRectLU(A)
% function ShowRectLU(A)
% Displays the factorization A = LU computed via outer product LU
% when A is rectangular.
% A call of the form ShowRectLU() sets A to be a random 6x3 example.
if nargin==0
    A = randn(6,3);
end
clc
[L,U] = RectLU(A);
fprintf('Rectangular LU\n\n')
disp('A = '), fprintfM('%11.6f',A)
disp('L = '), fprintfM('%11.6f',L)
disp('U = '), fprintfM('%11.6f',U)
fprintf('||A - LU|| = %20.15e\n',norm(A -L*U))