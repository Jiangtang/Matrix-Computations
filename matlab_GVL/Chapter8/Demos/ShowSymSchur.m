  function ShowSymSchur()
% function ShowSymSchur()
% Schur Decomposition for Symmetric Matrices
% GVL4; Section 8.1.1
n = 6;
A = randn(n,n); A = A+ A';
[Q,D] = schur(A); 
clc
fprintf('Symmetric Schur Decomposition: Q''AQ = D = diag(d1,...,dn)\n\n')
fprintf('A = ')
fprintfM('%8.3f',A)
fprintf('Q =')
fprintfM('%8.3f',Q)
fprintf('D = ')
fprintfM('%8.3f',D)
