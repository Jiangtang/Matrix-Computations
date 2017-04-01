  function  F = DiagF(f,A)
% function  F = DiagF(f,A)
% Function of a matrix via diagonalization.
% A is nxn and its eigenvalues are treated as distinct.
% f is a handle to a function f (assumed to be accessible).
% F = f(A)
% GVL4: Section 9.1
n = length(A);
[X,D] = eig(A);
% f(A) = X*f(D)*inv(X)
F = zeros(n,n);
for k=1:n
   F(:,k) = X(:,k)*f(D(k,k));
end
F = real(F/X);