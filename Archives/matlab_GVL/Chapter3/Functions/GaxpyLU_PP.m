  function [L,U,piv] = GaxpyLU_PP(A)
% function [L,U,piv] = GaxpyLU_PP(A)
% Gaxpy LU with partial pivoting.
% A is nxn. 
% L is nxn and unit lower triangular.
% U is nxn and upper triangular.
% piv(1:n-1) houses the pivot row indices.
% PA = LU where P = P_{n-1}...P_{1} and P_{k} is the identity with
% rows k and piv(k) interchanged.
% GVL4: Algorithm 3.4.2
[n,n] = size(A);
L = eye(n,n);
U = zeros(n,n);
piv = 1:n-1;
for j=1:n
    % Compute v(j:n) = Ptilde*A(j:n,j) - L(j:n,1:j-1)U(1:j-1,j) and
    % solve L(1:j-1,1:j-1)U(1:j-1,j) = Ptilde*A(1:j-1,j) where
    % Ptilde = P_{j-1}...P{1}...
    if j==1
        v = A(:,1);
    else
        a = A(:,j);
        for k=1:j-1
            a([piv(k) k]) = a([k piv(k)]);
        end
        z = L(1:j-1,1:j-1)\a(1:j-1);
        U(1:j-1,j) = z;
        % The Gaxpy...
        v(j:n) = a(j:n) - L(j:n,1:j-1)*z;
    end
    % Determine the maximal entry in |v(j:n)| and permute...
    if j<n
       [m,mu] = max(abs(v(j:n))); mu = mu+j-1; piv(j) = mu; 
       v([j piv(j)]) = v([piv(j) j]); L([j piv(j)],1:j-1) = L([piv(j) j],1:j-1);
    end
    % Complete the determination of U(1:j,j) and L(j+1:n,j)...
    U(j,j) = v(j);
    if v(j) ~=0
       L(j+1:n,j) = v(j+1:n)/v(j);
    end
end