  function [Q,R] = BlockHouseQR(A,r)
% function [Q,R] = BlockHouseQR(A,r)
% Block Householder QR
% A is mxn. Assume m>=n
% r is the blocking factor. Assume r<=n
% Q is mxm and orthogonal
% R is mxn and upper triangular with nonnegative diagonal entries.
% A = QR
% GVL4: Algorithm 5.2.2
[m,n] = size(A);
Q = eye(m,m);
lambda = 1;
while lambda <= n
    tau = min(lambda+r-1,n);
    % QR of next block column...
    [Qk,Rk] = HouseQR(A(lambda:m,lambda:tau));
    % Generate the WY representation of Qk...
    [Wk,Yk] = WY(Qk);
    % The WY update...
    rows = lambda:m;
    cols = lambda:n;
    A(rows,cols) = A(rows,cols) - Yk*(Wk'*A(rows,cols));
    Q(:,rows) = Q(:,rows) - (Q(:,rows)*Wk)*Yk';
    lambda = tau+1;
end
R = A;
