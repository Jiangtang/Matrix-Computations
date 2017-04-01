  function ShowHouseHess()
% function ShowHouseHess()
% Reduction to Hessenberg form via Householder
% GVL4: Algorithm 7.4.2
clc
fprintf('The Hessenberg Decomposition\n\n')
n = 6;
A = randn(n,n);
[U,H] = HouseHess(A);
fprintf('A = \n')
fprintfM('%7.3f',A)
fprintf('U = \n')
fprintfM('%7.3f',U)
fprintf('H = \n')
fprintfM('%7.3f',H)
fprintf('|| U''AU - H || = %10.3e\n',norm(U'*A*U - H))
fprintf('|| U''U - I  || = %10.3e\n',norm(U'*U - eye(n,n)))
