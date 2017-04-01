  function [Q,R] = GivensQR(A)
% function [Q,R] = GivensQR(A)
% Givens method for computing the QR factorization A = QR.
% A is mxn with m>=n.
% Q is mxm and orthogonal.
% R is mxn upper triangular so A = QR.
% GVL4: Algorithm 5.2.4
[m,n] = size(A);
Q = eye(m,m);
for j=1:n
    for i=m:-1:j+1
        [c,s] = Givens(A(i-1,j),A(i,j));
        A(i-1:i,j:n) = [c s;-s c]'*A(i-1:i,j:n);
        Q(:,i-1:i) = Q(:,i-1:i)*[c s ;-s c];
    end
end
R = A;