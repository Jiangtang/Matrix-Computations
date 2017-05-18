  function G = GaxpyChol(A)
% function G = GaxpyChol(A)
% Cholesky factorization of a symmetric positive definite matrix
% A is nxn symmetric and positive definite.
% G is nxn lower triangular and A = GG'.
% GVL4: Algorithm 4.2.1
n = length(A);
v = zeros(n,1);
for j=1:n
    v(j:n) = A(j:n,j) - A(j:n,1:j-1)*A(j,1:j-1)';
    A(j:n,j) = v(j:n)/sqrt(v(j));
end
G = tril(A);