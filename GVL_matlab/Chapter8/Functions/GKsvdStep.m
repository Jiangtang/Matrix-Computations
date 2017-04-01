  function B0 = GKsvdStep(B)
% function B0 = GKsvdStep(B)
% B is an nxn upper bidiagonal matrix with no zero entries inside the band
% B0 = U'*B*V is the updated bidiagonal obtained by performing one step
% of the Golub-Kahan update.
% GVL4: 8.6.1
n = length(B);
% The shift comes from the lower 2x2 od B'*B...
C = B(max(1,n-2):n,n-1:n)'*B(max(1,n-2):n,n-1:n)
d = eig(C);
if abs(d(1)-C(2,2))< abs(d(2)-C(2,2))
    mu = d(1);
else
    mu = d(2);
end
y = B(1,1)^2 -mu;
z = B(1,2)*B(1,1);
% Update B....
for k=1:n-1
    % If k>1, zero B(k,k+2)...
    [c,s] = Givens(y,z);
    B(max(1,k-1):k+1,k:k+1) = B(max(1,k-1):k+1,k:k+1)*[c s;-s c];
    y = B(k,k);
    z = B(k+1,k);
    % Zero B(k+1,k)...
    [c,s] = Givens(y,z);
    B(k:k+1,k:min(n,k+2)) = [c s;-s c]'*B(k:k+1,k:min(n,k+2));
    if k<n-1
        y = B(k,k+1);
        z = B(k,k+2);
    end
end
B0 = B;