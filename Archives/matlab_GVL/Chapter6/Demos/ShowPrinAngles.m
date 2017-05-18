  function ShowPrinAngles()
% function ShowPrinAngles()
% Examines the principal angles of two nearby subspaces.
clc
fprintf('Principal Angles\n\n')
m = 8;
n = 3;
tol = .3;
A = randn(m,n);
B = A + tol*(-1+2*rand(m,n));
[d,F,G] = PrinAngles(A,B);
fprintf('A = ')
fprintfM('%7.3f',A)
fprintf('B = ')
fprintfM('%7.3f',B)
fprintf('Cosines of the principal angles... ')
fprintfM('%12.8f',d)



