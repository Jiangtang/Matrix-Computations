  function [Q,R] = DeleteColQR(Q0,R0,k)
% function [Q,R] = DeleteColQR(Q0,R0,k)
% Update a QR factorization after a column has been deleted.
% Q0 is mxm orthogonal, R0 is mxn upper triangular with n<=m, 1<=k<=n
%   and w is mx1.
% Q is mxm orthogonal, R is mx(n+1) upper triangular so that 
%   QR = [A(:,1:k-1) A(:,k+1:n)].
% GVL4: Section 6.5.2.
[m,n] = size(R0);
Q = Q0;
R = [R0(:,1:k-1) R0(:,k+1:n)];
% R is triangular through its first k-1 columns
for i=k:min(m-1,n-1)
    % Zero R(i+1,i)...
    [c,s] = Givens(R(i,i),R(i+1,i));
    J = [c s ; -s c];
    idx = i:i+1;
    R(idx,i:n-1) = J'*R(idx,i:n-1);
    Q(:,idx) = Q(:,idx)*J;
end