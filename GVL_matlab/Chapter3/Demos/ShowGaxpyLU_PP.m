  function ShowGaxpyLU_PP(A)
% function ShowOuterLU_PP(A)
% Displays the factorization PA = LU computed via Gaxpy LU with
% partial pivoting.
% A call of the form ShowGaxpyLU_PP() sets A to be a random 5x5 example.
if nargin==0
    A = randn(5,5);
end
[L,U,piv] = GaxpyLU_PP(A);
n = length(piv)+1;
P = eye(n,n);
for k=1:n-1
    P([k piv(k)],:) = P([piv(k) k],:);
end
clc
fprintf('Gaxpy LU with partial pivoting.\n\n')
disp('A = '), fprintfM('%11.6f',A)
disp('P = '), fprintfM('%3d',P)
disp('L = '), fprintfM('%11.6f',L)
disp('U = '), fprintfM('%11.6f',U)
fprintf('||PA - LU|| = %20.15e\n',norm(P*A -L*U))