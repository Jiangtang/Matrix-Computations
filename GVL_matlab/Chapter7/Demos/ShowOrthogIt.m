  function ShowOrthogIt()
% function ShowOrthogIt()
% Illustrates orthognal iteration (unsymmetric case).
clc
fprintf('Orthogonal Iteration\n\n')
n = 6; itMax = 20; r = 3;
A = tril(randn(n,n),-1)+diag((1:n));
fprintf('A = \n')
fprintfM('%7.3f',A)
Q0 = eye(n,r);
[Q,Lambda] = OrthogIt(A,Q0,itMax);
fprintf('The %1d largest eigenvalues of this matrix are...\n\n',r)
d = eig(A); [ds,idx] = sort(abs(d),'descend');
fprintf('%20.15f',ds(idx(1:r)))
fprintf('\n\n')
disp('Orthogonal iteration estimates are...')
fprintfM('%20.15f',Lambda)







