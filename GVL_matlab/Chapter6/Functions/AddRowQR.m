  function [Q,R] = AddRowQR(Q0,R0,k,w)
% function [Q,R] = AddRowQR(Q0,R0,k,w)
% Update a QR factorization after a row has been added.
% Q0 is mxm orthogonal, R0 is mxn upper triangular with n<=m, 0<=k<=m
%   and w is nx1.
% Q is (m+1)x(m+1) orthogonal, R is (m+1)xn upper triangular so that 
%   QR = [A(1:k,:);w';A(k+1:m,:) ].
% GVL4: Section 6.5.3
[m,n] = size(R0);
R = [w'; R0];
Q = [1 zeros(1,m); zeros(m,1) Q0];
Q = [Q(2:k+1,:);1 zeros(1,m);Q(k+2:m+1,:)];
for i=1:n
    [c,s] = Givens(R(i,i),R(i+1,i));
    J = [c s;-s c];
    idx = i:i+1;
    R(idx,i:n) = J'*R(idx,i:n);
    Q(:,idx) = Q(:,idx)*J;
end