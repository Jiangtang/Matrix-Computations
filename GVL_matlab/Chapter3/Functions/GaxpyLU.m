  function [L,U] = GaxpyLU(A)
% function [L,U] = GaxpyLU(A)
% Gaxpy LU without pivoting.
% GVL4: Algorithm 3.2.2.
% A is nxn and has an LU factorization.
% L is nxn and unit lower triangular.
% U is nxn and upper triangular.
% A = LU.
[n,n] = size(A);
L = eye(n,n);
U = zeros(n,n);
for j=1:n
    % Compute v(j:n) = A(j:n,j) - L(j:n,1:j-1)U(1:j-1,j) and
    % solve L(1:j-1,1:j-1)U(1:j-1,j) = A(1:j-1,j)...
    if j==1
        v = A(:,1);
    else
        a = A(:,j);
        z = L(1:j-1,1:j-1)\a(1:j-1);
        U(1:j-1,j) = z;
        % The Gaxpy...
        v(j:n) = a(j:n) - L(j:n,1:j-1)*z;
    end
    % Complete the determination of U(1:j,j) and L(j+1:n,j)...
    U(j,j) = v(j);
    L(j+1:n,j) = v(j+1:n)/v(j);
end