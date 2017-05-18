  function [Q_fact,R] = HouseQR(A)
% function [Q_fact,R] = HouseQR(A)
% Householder method for computing the QR factorization A = QR.
% A is mxn with m>=n.
% Q_fact is mxn and  houses the factored form representation of the 
%    orthogonal factor Q.
% R is nxn and upper triangular with nonnegative diagonal entries 
%    so A = QR.
% GVL4: Algorithm 5.2.1
[m,n] = size(A);
for j=1:min(n,m-1)
    % Compute the jth Householder matrix Q{j}...
    [v,beta] = House(A(j:m,j));
    % Update...
    % A = Q{j}A
    A(j:m,j:n) = A(j:m,j:n) - (beta*v)*(v'*A(j:m,j:n));
    % Save the Householder vector...
    A(j+1:m,j) = v(2:m-j+1);
end
R = triu(A(1:n,1:n));
Q_fact = tril(A,-1);
