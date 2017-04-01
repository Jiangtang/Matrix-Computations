  function [L,T,P] = ParlettReid(A)
% function [L,T,P] = ParlettReid(A)
% Parlett-Reid factorization of a symmetric matrix.
% A is nxn and symmetric.
% L is nxn and unit lower triangular.
% T is nxn and tridiagonal.
% P is nxn and a permutation.
% PAP' = LTL'.
% GVL4: Section 4.4.1
n = length(A); 
L = eye(n,n); T = zeros(n,n); P = eye(n,n); 
u = zeros(n,1); w = zeros(n,1);
T(1,1) = A(1,1);    % alfa(1)
for k=1:n-2
    rows = k+1:n;
    % Pivot computations...
    [tau,p] = max(abs(A(rows,k)));
    kpiv = p+k;
    L([kpiv k+1],2:k) = L([k+1 kpiv],2:k);
    P([kpiv k+1],:)   = P([k+1 kpiv],:);
    A([kpiv k+1],k:n) = A([k+1 kpiv],k:n);
    A(k:n,[kpiv,k+1]) = A(k:n,[k+1 kpiv]);
    % Gauss vector computations...
    w(rows) = A(rows,k);
    T(k+1,k+1) = A(k+1,k+1);                  % alpha(k+1)
    T(k+1,k) = w(k+1); T(k,k+1) = w(k+1);     % beta(k)
    if tau>0
       w(k+2:n) = w(k+2:n)/w(k+1); w(k+1) = 0;
       L(k+2:n,k+1) = w(k+2:n);
    end
    % The symmetric update...
    u(rows) = A(rows,k+1) - (A(k+1,k+1)/2)*w(rows);
    A(rows,rows) = A(rows,rows)-w(rows)*u(rows)'-u(rows)*w(rows)'; 
end
T(n,n-1) = A(n,n-1); T(n-1,n) = A(n-1,n);     % beta(n-1)
T(n,n) = A(n,n);                              % alpha(n)
    