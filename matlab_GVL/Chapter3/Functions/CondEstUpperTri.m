  function [kappa,y] = CondEstUpperTri(T)
% function [kappa,y] = CondEstUpperTri(T)
% inf-norm condition estimator for upper triangular matrices.
% T is nxn, nonsingular, and upper triangular.
% kappa is an estimate of the inf-norm condition of T
% y is nx1 and satisfies norm(y,inf) = 1 and norm(Ty,'inf') = 1/kappa.
% GVL4: Algorithm 3.5.1.
n = length(T); y = zeros(n,1); p = zeros(n,1); 
% Solve Ty = d where d is vector of +1's and -1's. Choose the d(k)
% to create a large norm solution y. Assume d(n) = +1
y(n) = 1/T(n,n);
p(1:n-1) = T(1:n-1,n);
for k=n-1:-1:1
    % p(1:k) houses T(1:k,k+1:n)*y(k+1:n)
    % Implications if d(k) = +1...
    yk_plus  = (+1-p(k))/T(k,k);
    p_plus   = p(1:k-1) + T(1:k-1,k)*yk_plus;
    % Implications if d(k) = -1...
    yk_minus = (-1-p(k))/T(k,k);
    p_minus  = p(1:k-1) + T(1:k-1,k)*yk_minus;
    % Choose the alternative that maximizes growth...
    if abs(yk_plus) + norm(p_plus,1) >= abs(yk_minus) + norm(p_minus,1)
        y(k)     = yk_plus;
        p(1:k-1) = p_plus;
    else
        y(k)     = yk_minus;
        p(1:k-1) = p_minus;
    end  
end
kappa = norm(y,inf)*norm(T,inf);
y = y/norm(y,inf);