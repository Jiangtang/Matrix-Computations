  function ShowPolarDecomp()
% function ShowPolarDecomp()
% Illustrates convergence of Newton's method for the polar decomposition.
% GVL4: Section 9.4.3
n = 100;          % size of matrix
scale = 1000;     % norm(A) roughly scale*sqrt(n)
nStepsMax = 50;   % maximum number of Newton steps
A = scale*randn(n,n);
[U,S,V] = svd(A);
S_svd = U*V';
for k = 1:nStepsMax;
    S_Newton = PolarNewton(A,k);
    err(k) = norm(S_svd-S_Newton);
end
semilogy(1:nStepsMax,err)
xlabel('iteration','fontsize',14)
title(sprintf('Polar Decomp via Newton: n = %3d,  ||A||_2 = %10.2e',n,norm(A)),'fontsize',14)
ylabel(sprintf('|| UV^T - S_{Newton} ||_{2}'),'fontsize',14)
shg

  function S = PolarNewton(A,nSteps)
% function S = PolarNewton(A,nSteps)
% Matrix sign function based on nSteps of the Newton iteration.
% A is real nxn and S is approximately its orthogonal polar factor,
% i.e., the closest orthogonal matrix to A
% GVL4: Section 9.4.3.
S = A;
for k=0:nSteps-1
    S = (S + inv(S'))/2;
end


