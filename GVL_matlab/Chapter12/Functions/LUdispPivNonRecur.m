  function [L,U,P] = LUdispPivNonRecur(omega,lambda,R,S)
% function [L,U,P] = LUdispPivNonRecur(omega,lambda,R,S)
% Fast LU factorization of a Cauchy-like matrix with pivoting. 
% omega and lambda are column n-vectors with no common entries.
% R and S are nxr matrices.
% L is nxn unit lower triangular.
% U is nxn upper triangular.
% PA = LU  where A satisfies Omega*A - A*Lambda = R*S' with 
% Omega = diag(omega) and Lambda = diag(lambda).
% GVL4: Algorithm 12.1.2 (Nonrecursive implementation.)

[n,r] = size(R);
L = eye(n,n);
U = zeros(n,n);
P = eye(n,n);
for k=1:n-1 
    a = (R*S(1,:)')./(omega(k:n)-lambda(k));
    % Pivot computations...
    [m,j] = max(abs(a));
    a([1 j]) = a([j 1]);
    R([1 j],:) = R([j 1],:);
    L([k k+j-1],1:k-1) = L([k+j-1 k],1:k-1);
    P([k k+j-1],:) = P([k+j-1 k],:);
    omega([k k+j-1]) = omega([k+j-1 k]);
    % Updates...
    alfa = a(1);
    f = a(2:n-k+1);
    r1 = R(1,:)'; 
    s1 = S(1,:)'; 
    R1 = R(2:n-k+1,:);
    S1 = S(2:n-k+1,:);
    g = (S1*r1)./(omega(k)-lambda(k+1:n));
    R = R1 - f*(r1'/alfa);
    S = S1 - g*(s1'/alfa);
    L(k+1:n,k) = f/alfa;
    U(k,k) = alfa;
    U(k,k+1:n) = g';
end
U(n,n) = R*S'/(omega(n)-lambda(n));