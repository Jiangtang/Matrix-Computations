  function ShowOuterLU_CP(A)
% function ShowOuterLU_CP(A)
% Displays the factorization PA = LU computed via outer product LU with
% complete pivoting.
% A call of the form ShowOuterLU_CP() sets A to be a random 5x5 example.
if nargin==0
    A = randn(5,5);
end
[L,U,rowpiv,colpiv] = OuterLU_CP(A);
n = length(rowpiv)+1;
P = eye(n,n);
for k=1:n-1
    P([k rowpiv(k)],:) = P([rowpiv(k) k],:);
end
Q = eye(n,n);
for k=1:n-1
    Q([k colpiv(k)],:) = Q([colpiv(k) k],:);
end
clc
fprintf('Outer Product LU with complete pivoting.\n\n')
disp('A = '), fprintfM('%11.6f',A)
disp('P = '), fprintfM('%3d',P)
disp('Q = '), fprintfM('%3d',Q)
disp('L = '), fprintfM('%11.6f',L)
disp('U = '), fprintfM('%11.6f',U)
fprintf('||PAQ'' - LU|| = %20.15e\n',norm(P*A*Q' -L*U))