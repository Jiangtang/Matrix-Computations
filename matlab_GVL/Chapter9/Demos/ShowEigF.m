  function ShowEigF()
% function ShowEigF()
% Compute exp(A) via Jordan and Schur
% GVL4: Section 9.1
clc
fprintf('Two Ways to Compute exp(A)\n\n')
n = 5;
delta = .00001;
A = tril(randn(n,n),-1)+eye(n,n)+diag(delta*randn(n,1));
fprintf('The Eigenvalues of A:\n')
fprintfM('%20.15f',diag(A))
F = expm(A);
F1 = DiagF(@exp,A);
fprintf('\n|DiagF(f,A) - expm(A)| = \n')
fprintfM('%10.1e',abs(F1-F))
fprintf('\n|SchurParlett(f,A) - expm(A)| = \n')
F2 = SchurParlett(@exp,A);
fprintfM('%10.1e',abs(F2-F))


