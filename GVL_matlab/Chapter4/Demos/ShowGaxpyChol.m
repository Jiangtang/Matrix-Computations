  function ShowGaxpyChol(A)
% function ShowGaxpyChol(A)
% Displays the Cholesky factorization A = GG' computed using Gaxpy
% Cholesky.
% A call of the form ShowGaxpyChol() sets A to be a random 5x5 example.
if nargin==0
    A = randn(5,5); A = A'*A;
end
clc
fprintf('Gaxpy Cholesky\n\n')
disp('A =')
fprintfM('%10.3f',A)
disp('G = ')
G = GaxpyChol(A);
fprintfM('%10.3f',G)
fprintf('||A - GG''|| = %10.3e\n',norm(G*G'-A))