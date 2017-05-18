function N = nulbasis(A)
% NULBASIS(A) is a matrix whose columns form a basis
% for the null space of A. The basis is obtained from
% the reduced row echelon form of A.
[R,jp] = rref(A);
[m,n] = size(A);
r = length(jp);
nmr = n - r;
N = zeros(n,nmr);
kp = other(jp,n);
    % Construct N, the matrix of basis vectors
for q = 1:nmr
    N(kp(q),q) = 1;
    N(jp,q) = -R(1:r,kp(q));
end
