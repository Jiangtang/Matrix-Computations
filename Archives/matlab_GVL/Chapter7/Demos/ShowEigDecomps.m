  function ShowEigDecomps()
% function ShowEigDecomps()
% Illustrates two eigenvalue decompositions
% GVL4: Section 7.1.1
clc
format short
fprintf('Diagonalization vs Schur\n\n')
fprintf('A nice example...\n\n')
% A nice matrix...
A = [ 2 18 -27  ; 10 -31 57 ; 7 -22 40];
fprintf('A =')
fprintfM('%5d',A)
fprintf('This matrix has eigenvalues 2-3i, 2+3i, and 7.\n')
fprintf('\nIts Schur decomposition A = QTQ'' is given by\n')
[Q,T] = schur(A,'complex');
Q = Q
T = T
fprintf('\nIts diagonalization A = XDX^-1 is given by\n\n')
[X,D] = eig(A);
X = X
D = D
fprintf('\n\nA Not Nice example...\n')
A = gallery(5)
fprintf('The eigenvalues via diagonalization...\n\n')
disp(diag(diag(eig(A))))
fprintf('The eigenvalues via the Schur decomposition...\n\n')
disp(diag(schur(A,'complex')))

