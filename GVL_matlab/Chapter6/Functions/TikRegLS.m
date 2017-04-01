  function x = TikRegLS(A,b,B,lambda)
% function x = TikRegLS(A,b,B,lambda)
% Least squares with Tikhonov regularization
% A is mxn, b is mx1, B is nxn, lambda>0, and it is assumed
% that 0 is the only vector that is in both null(A) and null(B).
% GVL4: Section 6.1.5
[m,n] = size(A);
x = [A;sqrt(lambda)*B]\[b;zeros(n,1)];