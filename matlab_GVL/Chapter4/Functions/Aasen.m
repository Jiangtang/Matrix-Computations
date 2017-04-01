  function [L,T,P] = Aasen(A)
% function [L,T,P] = Aasen(A)
% Aasen factorization of a symmetric matrix.
% A is nxn and symmetric.
% L is nxn and unit lower triangular.
% T is nxn and tridiagonal.
% P is nxn and a permutation.
% PAP' = LTL'
% GVL4: Section 4.4.2
n = length(A); 
L = eye(n,n); T = zeros(n,n); P = eye(n,n); 
v = zeros(n,1); h = zeros(n,1);
for j=1:n
    if j==1
       T(1,1) = A(1,1);
       v(2:n) = A(2:n,1);
    else
       % Compute h(1:j) where h is the jth column of TL'...
       h(1) = T(2,1)*L(j,2);
       for k=2:j-1
            h(k)= T(k,k-1)*L(j,k-1) + T(k,k)*L(j,k) + T(k+1,k)*L(j,k+1);
       end
       h(j) = A(j,j) - L(j,1:j-1)*h(1:j-1);
       T(j,j) = h(j) - T(j,j-1)*L(j,j-1);
       v(j+1:n) = A(j+1:n,j) - L(j+1:n,1:j)*h(1:j);
    end
    if j<=n-1
       % Pivot computations...
       [tau,p] = max(abs(v(j+1:n)));
       jpiv = p+j;
       v([jpiv j+1]) = v([j+1 jpiv]);
       L([jpiv j+1],2:j) = L([j+1 jpiv],2:j);
       P([jpiv j+1],:)   = P([j+1 jpiv],:);
       A([jpiv j+1],j:n) = A([j+1 jpiv],j:n);
       A(j:n,[jpiv,j+1]) = A(j:n,[j+1 jpiv]);
       % beta(j)...
       T(j+1,j) = v(j+1); T(j,j+1) = v(j+1);   
    end
    if tau> 0 && j<=n-2
        L(j+2:n,j+1) = v(j+2:n)/v(j+1);
    end
end