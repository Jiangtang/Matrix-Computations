  function [U_fact,B,V_fact] = HouseBidiag(A)
% function [U_fact,B,V_fact] = HouseBiDiag(A)
% Bidiagonalization U'*A*V = B via Householder transformations.
% A is mxn with m>=n.
% U_fact is mxn and houses the factored form representation of U.
% V_fact is nxn and houses the factored form representation of V.
% B is  upper bidiagonal with nonnegative entries.
% GVL4: Algorithm 5.4.2
[m,n] = size(A);
for j=1:min(n,m-1)
    % Compute the jth Householder matrix U{j}...
    [u,beta] = House(A(j:m,j));
    % Update...
    % A = U{j}A
    A(j:m,j:n) = A(j:m,j:n) - (beta*u)*(u'*A(j:m,j:n));
    % Save the Householder vector...
    A(j+1:m,j) = u(2:m-j+1);
    if j+2<=n
       % Compute the jth Householder matrix V{j}...
       [v,beta] = House(A(j,j+1:n)');
       % Update...
       % A = AV{j}
       A(j:m,j+1:n) = A(j:m,j+1:n) - (A(j:m,j+1:n)*v)*(beta*v)';
       % Save the Householder vector...
       A(j,j+2:n) = v(2:n-j)';  
    end  
end
B = tril(triu(A),1);
U_fact = tril(A,-1);
V_fact = zeros(n,n);
for j=1:n-2
   V_fact(j+2:n,j+1) = A(j,j+2:n)';
end
