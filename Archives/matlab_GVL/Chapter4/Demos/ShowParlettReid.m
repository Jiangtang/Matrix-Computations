  function ShowParlettReid(A)
% function ShowParlettReid(A)
% Illustrates the Partlett-Reid factorization for a symmetric matrix A.
% A call of the form ShowParlettReid() generates a random 7x7 example.
if nargin==0
    n = 7;
    A = randn(n,n);
    A = A + A';
end
[L,T,P] = ParlettReid(A);
clc
fprintf('Parlett-Reid Factorization\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('P = ')
fprintfM('%3d',P)
disp('L = ')
fprintfM('%7.3f',L)
disp('T = ')
fprintfM('%7.3f',T)
fprintf('||PAP'' - LTL'' || = %10.3e\n\n',norm(P*A*P' - L*T*L'))