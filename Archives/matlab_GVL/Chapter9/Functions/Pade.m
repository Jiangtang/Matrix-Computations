  function [F,j,q] = Pade(A,delta)
% function [F,j,q] = Pade(A)
% Matrix exponential via diagonal Pade approximation with scaling and squaring.
% F = (R_{qq}(A/2^j))^(2^j) where R_{qq}() is the (q,q) Pade approximation
% to exp() and j is a nonnegative integer. q and j are chosen so that the
% relative error is approximately bounded by delta
% A call of the form F = Pade(A,delta) simply returns F.
% GVL4: Algorithm 9.3.1
n = length(A);
delta = max(eps,delta);
% Squaring factor...
j = max(0,1+floor(log2(norm(A,'inf'))));
% Order of the Pade approximation...
q = 0;
eps_qq = 8;
while eps_qq>delta
    q = q+1;
    eps_qq = 2^(3-2*q)*(factorial(q)/factorial(2*q))^2/(2*q+1);
end
% Scale... 
A = A/2^j;
% (q,q) Pade...
c = 1; X = eye(n,n); N = eye(n,n); D = eye(n,n);
for k=1:q
    c = c*(q-k+1)/((2*q-k+1)*k);
    X = A*X; N = N + c*X; D = D +(-1)^k*c*X;
end
F = D\N;
% Repeated squaring...
for k=1:j
    F = F^2;
end