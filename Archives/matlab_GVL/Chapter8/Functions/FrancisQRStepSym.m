  function T = FrancisQRStepSym(T0)
% function T = FrancisQRStepSym(T0)
% T0 is an unreduced symmetric tridiagonal matrix.
% T is the symmetric tridiagonal matrix that results when 
% one step of the Francis implicit shift algorithm is applied
% with the Wilkinson shift
% GVL4: Algorithm 8.3.2

T = T0;
n = length(T);
if n<=2
    T = schur(T);
    return
end
m = n-1;
% Compute the first column of (T-muI) where
% mu is the eigenvalue of the lower 2x2 closer to T(n,n).
d = (T(m,m)-T(n,n))/2;
mu = T(n,n) - T(n,n-1)^2/(d + sign(d)*sqrt(d^2+T(n,n-1)^2));
x = T(1,1)-mu;
z = T(2,1);
for k=1:n-1
    [c,s] = Givens(x,z);
    jdx = max(1,k-1):min(k+2,n);
    T(k:k+1,jdx) = [c s;-s c]'*T(k:k+1,jdx);
    T(jdx,k:k+1) = T(jdx,k:k+1)*[c s;-s c];
    if k<n-1
        x = T(k+1,k);
        z = T(k+2,k);
    end
end
% Force symmetry and tridiagonal structure...
T = tril(triu(T,-1),1);
T = (T + T')/2;
