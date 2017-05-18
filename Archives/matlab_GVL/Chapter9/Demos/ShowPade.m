  function ShowPade()
% function ShowPade()
% Error in Pade approximation to exp(A) with scaling and squaring
% GVL4: Section 9.3.1
clc
fprintf('Pade approximation to exp(A) with scaling and squaring\n\n')
n = 10; A = 10*randn(n,n); F0 = expm(A);
fprintf(' delta       ||Pade(A,delta)-expm(A)||  j   q\n')
fprintf('-----------------------------------------------\n')
for delta = logspace(-1,-16,16)
    [F,j,q] = Pade(A,delta);
    err = norm(F-F0)/norm(F0);
    fprintf('  %7.1e           %10.3e         %1d   %1d  \n',delta,err,j,q)
end
    


