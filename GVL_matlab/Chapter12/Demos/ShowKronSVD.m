  function ShowKronSVD()
% function ShowKronSVD()
% Illustrates the Kronecker Product SVD
% Generate a random A that is an m1xn1 block matrix with mxn2 blocks...
m1 = 6; 
n1 = 4;
m2 = 3;
n2 = 5;
A = randn(m1*m2,n1*n2);
% Compute the decomposition...
r = min(m1*n1,m2*n2);
[B,C,sigma] = KronSVD(A,m1,n1,m2,n2,r);
% Examine nearest matrices that are the sum of k Kronecker products...
Xk = zeros(m1*m2,n1*n2);
clc
fprintf('The Kronecker Product SVD\n\n')
fprintf('A is %1d-by-%1d block matrix with %1d-by-%1d blocks\n\n',m1,n1,m2,n2)
disp('Xk is the nearest matrix to A that is the sum of k Kronecker products.')
fprintf('\nr = %1d is the KP rank and sigma(1:r) are the KP singular values.\n',r)
disp(' ')
disp('  k   || A - Xk ||_F     || sigma(k+1:r) ||_2 ')
disp('------------------------------------------------------------')
for k=1:r
    Xk = Xk + sigma(k)*kron(B{k},C{k});
    res1 = norm(A-Xk,'fro');
    res2 = norm(sigma(k+1:r));
    fprintf(' %2d   %10.3f         %10.3f\n', k, res1,res2) 
end
