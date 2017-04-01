  function ShowHouseTriDiag()
% function ShowHouseTriDiag()
% Reduction to tridiagonal form via Householder
% GVL4: Algorithm 8.3.1
clc
fprintf('Householde Reduction to Tridiagonal Form\n\n')
n = 6;
A = randn(n,n);
A = A + A';
[U,T] = HouseTriDiag(A);
fprintf('A = \n')
fprintfM('%7.3f',A)
fprintf('U = \n')
fprintfM('%7.3f',U)
fprintf('T = \n')
fprintfM('%7.3f',T)
fprintf('|| U''AU - T || = %10.3e\n',norm(U'*A*U - T))
fprintf('|| U''U - I  || = %10.3e\n',norm(U'*U - eye(n,n)))


