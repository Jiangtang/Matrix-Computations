  function ShowProcrustes()
% function ShowProcrustes()
% minimize || A - BQ ||_F where A and B are the same size and Q is
% orthogonal.
clc
fprintf('The Orthogonal Procrustes Problem\n\n')
m = 7;
n = 4;
A = randn(m,n);
[Q0,R] = qr(randn(n,n));
B = A*Q0 + .01*(-1+2*rand(m,n));
Q = Procrustes(A,B);
fprintf('A =')
fprintfM('%7.3f',A)
fprintf('B =')
fprintfM('%7.3f',B)
fprintf('Q =')
fprintfM('%7.3f',Q)
fprintf('||A - BQ||_{F} = %10.3e\n',norm(A-B*Q,'fro'))

