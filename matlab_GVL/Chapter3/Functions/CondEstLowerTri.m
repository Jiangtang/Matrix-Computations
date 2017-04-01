  function [kappa,y] = CondEstLowerTri(L)
% function [kappa,y] = CondEstLowerTri(L)
% inf-norm condition estimator for lower triangular matrices.
% GVL4: Section 3.5.4
% T is nxn, nonsingular, and  upper triangular.
% kappa is an estimate of the inf-norm condition of T
% y is nx1, satisfies norm(y,inf) = 1 and norm(Ty,'inf') = 1/kappa.

n = length(L); y = zeros(n,1); p = zeros(n,1); 
% Solve Ly = d where d is vector of +1's and -1's. Choose the d(k)
% to create a large norm solution y. Assume d(1) = +1
y(1) = 1/L(1,1);
p(2:n) = L(2:n,1);
for k=2:n
    % p(k:n) houses L(k:n,1:k-1)*y(1:k-1)
    % Implications if d(k) = +1...
    yk_plus  = (+1-p(k))/L(k,k);
    p_plus   = p(k+1:n) + L(k+1:n,k)*yk_plus;
    % Implications if d(k) = -1...
    yk_minus = (-1-p(k))/L(k,k);
    p_minus  = p(k+1:n) + L(k+1:n,k)*yk_minus;
    % Choose the alternative that maximizes growth...
    if abs(yk_plus) + norm(p_plus,1) >= abs(yk_minus) + norm(p_minus,1)
        y(k)     = yk_plus;
        p(k+1:n) = p_plus;
    else
        y(k)     = yk_minus;
        p(k+1:n) = p_minus;
    end  
end
kappa = norm(y,inf)*norm(L,inf);
y = y/norm(y,inf);