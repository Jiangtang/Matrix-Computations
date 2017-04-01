  function ShowDistSubspaces()
% function ShowDistSubspaces()
% Distance Between Subspaces
clc
fprintf('Distance Between Two Nearby Subspaces\n\n')
m = 7;
n = 4;
tol = .01;
A = randn(m,n);
B = A + tol*(-1+2*rand(m,n));
fprintf('A =')
fprintfM('%7.3f',A)
fprintf('B =')
fprintfM('%7.3f',B)
fprintf('dist(ran(A),ran(B)) = %10.3e\n',DistSubspaces(A,B))