  function [Q_fact,R,P] = HouseQRPiv(A)
% function [Q_fact,R,P] = HouseQRPiv(A)
% Householder QR with column pivoting
% A is mxn with m>=n
% Q_fact mxn factored form representation of the orthogonal factor Q
% R is nxn  upper triangular with nonnegative diagonal entries and the
%   property that R(j,j) >= norm(A(j:k,k), k=j:n
% P is an nxn permutation
% AP = QR
% GVL4: Algorithm 5.4.1
[m,n] = size(A);
for j=1:n
    c(j) = A(:,j)'*A(:,j);
end
P = eye(n,n);
r = 0;
[tau,k] = max(c);
while tau>0 && r<min(m,n)
    r = r+1;
    % Column interchange...
    A(:,[r k]) = A(:,[k r]);
    P(:,[r k]) = P(:,[k r]);
    c([r k]) = c([k r]);
    % Compute the rth Householder matrix Q{r}...
    [v,beta] = House(A(r:m,r));
    % Update...
    % A = Q{r}A
    A(r:m,r:n) = A(r:m,r:n) - (beta*v)*(v'*A(r:m,r:n));
    % Save the Householder vector...
    A(r+1:m,r) = v(2:m-r+1);
    if r<min(m,n)
       c(r+1:n) = c(r+1:n)- A(r,r+1:n).^2;
       [tau k] = max(c(r+1:n));
       k = k+r;
    end
end
R = triu(A(1:n,1:n));
Q_fact = tril(A,-1);
