  function [Q,R] = DeleteRowQR(Q0,R0,k)
% function [Q,R] = DeleteRowQR(Q0,R0,k,)
% Update a QR factorization after a row has been deleted.
% Q0 is mxm orthogonal, R0 is mxn upper triangular with n<m, 1<=k<=m.
% Q is (m-1)x(m-1) orthogonal, R is (m-1)xn upper triangular so that 
%   QR = [A(1:k-1,:);A(k+1:m,:) ].
% GVL4: Section 6.5.3
[m,n] = size(R0);
Q0 = [Q0(k,:);Q0(1:k-1,:);Q0(k+1:m,:)];
for i=m-1:-1:1
    [c,s] = Givens(Q0(1,i),Q0(1,i+1));
    J = [c s;-s c];
    idx = i:i+1;
    Q0(:,idx) = Q0(:,idx)*J;
    R0(idx,i:n) = J'*R0(idx,i:n);
end
Q = Q0(2:m,2:m);
R = R0(2:m,:);