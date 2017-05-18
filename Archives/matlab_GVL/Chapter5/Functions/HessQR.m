  function [Q,R] = HessQR(A)
% function [Q,R] = HessQR(A)
% QR factorization of an upper Hessenberg matrix.
% A is nxn.
% Q is nxn and orthogonal.
% R is nxn upper triangular with nonnegative diagonal entries.
% GVL4: Algorithm 5.2.5
[n,n] = size(A);
Q = eye(n,n);
for j=1:n-1
    [c,s] = Givens(A(j,j),A(j+1,j));
    A(j:j+1,j:n) = [c s;-s c]'*A(j:j+1,j:n);
    Q(:,j:j+1) = Q(:,j:j+1)*[c s ;-s c];
end
R = A;