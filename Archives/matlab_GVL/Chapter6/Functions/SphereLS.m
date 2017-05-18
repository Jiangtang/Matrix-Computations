function [x,lambda_star] = SphereLS(A,b,alpha)
% function x = SphereLS(A,b,alpha)
% Least squares minimization over a sphere.
% A is mxn, rank(A) = n, b is mx1, and alpha>0.
% x minimizes norm(Ax-b) over the sphere of radius alpha
% GVL4: Algorithm 6.2.1
[U,S,V] = svd(A,0);
s = diag(S);
btilde = U'*b;
xLS = V*(btilde./s);
if norm(xLS)<=alpha
    % Unconstrained minmizer is feasible..
    x = xLS;
    lambda_star = 0;
else
    % Solve the secular equation...
    % We know that f(0) > 0. A simple analysis shows that f(tau)<0 if
    tau = s(1)^2;
    z = [f(0,btilde,s,alpha) f(tau,btilde,s,alpha)];
    % Find the unique positive root for f...
    [lambda_star,secVal] = fzero(@(lambda) f(lambda,btilde,s,alpha),[0,tau]);
    x = V*((s.*btilde)./(s.^2+lambda_star));
    secVal = secVal;
end

  function z = f(lambda,btilde,s,alpha)
% This function is zero if lambda satisfies the secular equation.
% GVL: Section 6.2.1
z = sum(((s.*btilde)./(s.^2+lambda)).^2) - alpha^2;