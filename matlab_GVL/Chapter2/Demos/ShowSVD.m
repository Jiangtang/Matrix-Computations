  function ShowSVD()
% function ShowSVD()
% Illustrates the SVD.
m = 6;
n = 4;
A = randn(m,n);
[U,S,V] = svd(A);
clc
fprintf('The Singular Value Decomposition\n\n')
fprintf('\nA =')
fprintfM('%7.3f',A)
fprintf('U (orthogonal) =')
fprintfM('%7.3f',U)
fprintf('S (diagonal) =')
fprintfM('%7.3f',S)
fprintf('V (orthogonal) =')
fprintfM('%7.3f',V)
fprintf('||A - USV''|| = %10.3e\n',norm(A - U*S*V'))
fprintf('||A - U(:,1:n)S(1:n,1:n)V''|| = %10.3e\n',norm(A - U(:,1:n)*S(1:n,1:n)*V'))
