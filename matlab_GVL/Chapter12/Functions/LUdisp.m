  function [L,U] = LUdisp(omega,lambda,R,S)
% function [L,U] = LUdisp(omega,lambda,R,S)
% Fast LU factorization of a Cauchy-like matrix without pivoting. 
% omega and lambda are column n-vectors with no common entries.
% R and S are nxr matrices.
% L is nxn unit lower triangular.
% U is nxn upper triangular.
% A = LU  where A satisfies Omega*A - A*Lambda = R*S' with 
% Omega = diag(omega) and Lambda = diag(lambda).It is assumed that A
% has an LU factorization.
% GVL4: Algorithm 12.1.1

n = length(omega);
a = (R*S(1,:)')./(omega - lambda(1));
r1 = R(1,:)'; R1 = R(2:n,:);
s1 = S(1,:)'; S1 = S(2:n,:);
if n==1
    L = 1;
    U = r1'*s1/(omega(1)-lambda(1));
else
    a = (R*s1)./(omega-lambda(1));
    alfa = a(1);
    f = a(2:n);
    g = (S1*r1)./(omega(1) - lambda(2:n));
    R1tilde = R1 - f*r1'/alfa;
    S1tilde = S1 - g*s1'/alfa;
    [L1,U1] = LUdisp(omega(2:n),lambda(2:n),R1tilde,S1tilde);
    L = [1 zeros(1,n-1); f/alfa L1];
    U = [alfa g';zeros(n-1,1) U1];
end