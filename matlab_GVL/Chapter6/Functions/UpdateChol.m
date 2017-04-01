  function G = UpdateChol(G0,z)
% function G = UpdateChol(G0,z)
% Updating a Cholesky factorization.
% G0 is nxn lower triangular and z is nx1. G is nxn lower triangular
%    such that G*G' = G0*G0'+z*z'.
% GVL4: Section 6.5.4
n = length(z);
G = [G0 z];
% G is nx(n+1) lower Hessenberg
for k=1:n
    % Zero G(k,n+1) using a Givens rotation...
    [c,s] = Givens(G(k,k),G(k,n+1));
    J = [c s;-s c];
    G(k:n,[k n+1]) = G(k:n,[k n+1])*J;
end
G = G(1:n,1:n);