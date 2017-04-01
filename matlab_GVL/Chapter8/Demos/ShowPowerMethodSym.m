  function ShowPowerMethodSym()
% function ShowPowerMethodSym()
% Illustrates the power method (symmetric case).
% GVL4: Section 8.2.1
n = 100;
itMax =1000;
% Generate A and get is key properties...
A = randn(n,n); A = (A+A')/2; [Q,D] = schur(A);
[d,idx] = sort(abs(diag(D)),'descend');
lambda1 = D(idx(1),idx(1)) ;
q1 = Q(:,idx(1)); 
lambda2 = D(idx(2),idx(2));
r = abs(lambda2/lambda1);
% Initialize the power method...
q = randn(n,1); q = q/norm(q);
% Needed for bounds...
cosTheta0 = abs(q'*q1); 
sinTheta0 = sqrt(1-cosTheta0^2); 
tanTheta0 = sinTheta0/cosTheta0;
del = max(abs(diag(D)-lambda1));
% Start the iteration...
k = 0;
eigErr = []; eigErrBound = []; sinThetak = []; sinThetakBound = [];
z = A*q;
lambda = q'*z;
while  k<=itMax && norm(z - lambda*q)>=10^-6
    k = k+1;
    q = z/norm(z);
    z = A*q;
    lambda = q'*z;
    eigErr = [eigErr abs(lambda1-lambda)];
    eigErrBound = [eigErrBound del*tanTheta0^2*r^(2*k)];
    cosThetak = abs(q'*q1); 
    sinThetak = [sinThetak sqrt(1-cosThetak^2)];
    sinThetakBound = [sinThetakBound del*tanTheta0*r^k];
end
kRange=1:k;
close all
semilogy(kRange,eigErr,kRange,eigErrBound)
xlabel(sprintf('Note: |lambda2/lambda1| = %7.4f',r))
title(sprintf('Error in kth eigenvalue iterate and its upper bound.'))
figure
semilogy(kRange,sinThetak,kRange,sinThetakBound)
xlabel(sprintf('Note: |lambda2/lambda1| = %7.4f',r))
title(sprintf('Error in kth eigenvector iterate and its upper bound'))
shg