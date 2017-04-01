  function ShowSymDef()
% function ShowSymDef()
% Looks at the solution of the symmetric-definite eigenvalue problem.
% Shows that the small eigenvalues can sometimes be computed accurately
% even if B is ill-conditioned.
% GVL4: Algorithm 8.7.1. 
n = 6;
clc
fprintf('Symmetric-Definite Eigenvalue Problem\n\n')
for kappa = logspace(1,12,12)
    % Generate an example where  cond(B) is approximately kappa
    DA = diag(randn(n,1));
    DB = diag(linspace(1/kappa,1,n));
    Z = randn(n,n);
    A = Z*DA*Z';
    B = Z*DB*Z';
    kappaB = cond(B);
    % The ``exact'' generalized eigenvalues...
    e = sort(diag(DA)./diag(DB));
    % The computed generalized eigenvalues
    [X,D] = SymDef(A,B);
    d = sort(diag(D));
    r = abs(d-e)./abs(e);
    fprintf('\n\nkappa(B) = %10.3e\n\n',kappaB)
    fprintf('   Eigenvalue            Relative Error\n')
    fprintf('----------------------------------------------------\n')
    for k=1:n
        fprintf('%20.12e        %10.3e\n',d(k),r(k))
    end
end