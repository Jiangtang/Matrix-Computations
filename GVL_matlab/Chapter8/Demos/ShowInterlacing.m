  function ShowInterlacing()
% function ShowInterlacing()
% The eigenvalue interlacing property for symmetric matrices
% GVL4: Theorem 8.1.7
clc
fprintf('The Eigenvalue Interlacing Property for Symmetric Matrices\n\n')
n = 6;
A = randn(n,n); A = A+A';
fprintf(' k                               eig(A(1:k,1:k)\n')
fprintf('-----------------------------------------------------------------------\n')
for k=1:n
    lambda = eig(A(1:k,1:k));
    fprintf(' %1d    ',k)
    fprintf(blanks(37-6*k))
    fprintf('%6.3f      ',lambda)
    fprintf('\n')
end
    