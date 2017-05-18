  function ShowTLS()
% function ShowTLS()
% Compares Total Least Squares and Least Squares
m = 10;
n = 5;
A = randn(m,n);
b = randn(m,1);
d = ones(m,1);
xLS = A\b;
clc
fprintf('Total Least Squares\n\n')
fprintf('\nxTLS --> xLS as t = [1 1 ... 1 t(n+1)] --> [ 1 1 ... 1 0]\n')
for k=1:8
    t = [ones(n,1); 1/10^k];
    xTLS = TLS(A,b,d,t);
    fprintf('\n++++++++++++++++++++++++++++++++++++++\n')
    fprintf('\nt(%1d) = %10.3e\n\n',n+1,t(n+1))
    fprintf('          xLS                xTLS ')
    fprintfM('%20.15f',[xLS xTLS])
    fprintf('||xLS - xTLS|| = %10.3e\n',norm(xLS-xTLS))
end