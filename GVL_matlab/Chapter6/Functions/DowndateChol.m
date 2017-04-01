  function G = DowndateChol(G0,z)
% function G = DowndateChol(G0,z)
% Downdating a Cholesky factorization.
% G0 is nxn lower triangular and z is nx1. G is nxn lower triangular
%    such that G*G' = G0*G0'-z*z'.
% GVL4: Section 6.5.4
n = length(z);
G = [G0 z];
% G is nx(n+1) lower Hessenberg
for k=1:n
    % Zero G(k,n+1) using a hyperbolic rotation...
    [c,s] = HyperRot(G(k,k),G(k,n+1));
    H = [c -s;-s c];
    G(k:n,[k n+1]) = G(k:n,[k n+1])*H;
end


  function [c,s] = HyperRot(x1,x2)
% function [c,s] = HyperRot(x1,x2)
% 2x2 Hyperbolic rotation
% GVL4: Section 6.5.4
if x2==0
    s = 0; c = 1;
else
    if abs(x2) < abs(x1)
        tau = x2/x1; c = 1/sqrt(1-tau^2); s = c*tau;
    else
        tau = x1/x2; s = 1/sqrt(1-tau^2); c = s*tau; 
    end
end