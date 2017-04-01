  function ShowSturm()
% function ShowSturm()
% Illustrates the Sturm sequence property
% GVL4: Section 8.4.2
n = 20;
% Generate an nxn symmetric tridiagonal matrix...
A = randn(n,n); A = A+A'; T = hess(A);
% Use Sturm to compute every single eigenvalue...
lambda = [];
for k=1:n
   lambda = [lambda;Sturm(T,k)];
end
clc
fprintf('Using the Sturm Sequence Property\n\n')
fprintf('      Eigenvalues Via Sturm     Eigenvalues Via eig\n')
fprintf('--------------------------------------------------------\n')
fprintfM('%25.15f',[lambda sort(eig(T),'descend')])


   
