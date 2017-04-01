  function x = TridiagSol(alfa,beta,b)
% function x = TridiagSol(alfa,beta,b)
% Symmetric positive definite tridiagonal system solver.
% alfa is nx1 and the diagonal of A,  beta is (n-1)x1 is the subdiagonal
%    of A, and b is nx1.
% x is nx1 and solves Ax = b
% GVL4: Algorithm 4.3.6
n = length(alfa);
for k=2:n
    t = beta(k-1); beta(k-1) = t/alfa(k-1); alfa(k) = alfa(k) - t*beta(k-1);
end
for k=2:n
    b(k) = b(k)-beta(k-1)*b(k-1);
end
b(n) = b(n)/alfa(n);
for k=n-1:-1:1
    b(k) = b(k)/alfa(k) - beta(k)*b(k+1);
end
x = b;