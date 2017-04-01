  function [L,U,P] = LUdispPiv(omega,lambda,R,S)
% function [L,U,P] = LUdispPiv(omega,lambda,R,S)
% Fast LU factorization of a Cauchy-like matrix with partial pivoting. 
% omega and lambda are column n-vectors with no common entries.
% R and S are nxr matrices.
% L is nxn unit lower triangular.
% U is nxn upper triangular.
% P is nxn permutation.
% PA = LU  where A satisfies Omega*A - A*Lambda = R*S' with 
%      Omega = diag(omega) and Lambda = diag(lambda).
% GVL4: Algorithm 12.1.2

n = length(omega);
a = (R*S(1,:)')./(omega - lambda(1));
[m,k] = max(abs(a));
P = eye(n,n);
P([1 k],:) = P([k 1],:);
R([1 k],:) = R([k 1],:);
omega([1 k]) = omega([k 1]);

r1 = R(1,:)';
s1 = S(1,:)';
alfa = r1'*s1/(omega(1)-lambda(1));
if n==1
    L = 1;
    U = alfa;
else
    Rtilde = R(2:n,:);
    Stilde = S(2:n,:);
    f = (Rtilde*s1)./(omega(2:n) - lambda(1));
    g = (Stilde*r1)./(omega(1) - lambda(2:n));
    Rtilde = Rtilde - f*r1'/alfa;
    Stilde = Stilde - g*s1'/alfa;
    [L1,U1,P1] = LUdispPiv(omega(2:n),lambda(2:n),Rtilde,Stilde);
    L = [1 zeros(1,n-1); P1*f/alfa L1];
    U = [alfa g';zeros(n-1,1) U1];
    P = [1 zeros(1,n-1);zeros(n-1,1) P1]*P;
end 