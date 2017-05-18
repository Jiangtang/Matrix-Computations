  function H = FrancisQRStep(H0)
% function H = FrancisQRStep(H0)
% H0 is an unreduced upper Hessenberg matrix.
% H is the upper Hessenberg matrix that results when one step of the
% Francis double implicit shift algorithm is applied.
% GVL4: Algorithm 7.5.1

H = H0;
n = length(H);
if n<=2
    return
end
m = n-1;
% Compute the first column of (H-alfa1*I)(H-alfa2*I)) where
% alfa 1 and alfa2 are the eigenvalues of the lower 2x2...
s = H(m,m)+H(n,n);
t = H(m,m)*H(n,n) - H(m,n)*H(n,m);
x = H(1,1)*H(1,1)+H(1,2)*H(2,1) - s*H(1,1) + t;
y = H(2,1)*(H(1,1)+H(2,2)-s);
z = H(2,1)*H(3,2);
% Chase the bulge...
for k=0:n-3
    [v,beta] = House([x;y;z]);
    q = max(1,k);
    H(k+1:k+3,q:n) =  H(k+1:k+3,q:n) - (beta*v)*(v'*H(k+1:k+3,q:n));
    r = min(k+4,n);
    H(1:r,k+1:k+3) =  H(1:r,k+1:k+3) - (H(1:r,k+1:k+3)*v)*(beta*v)';
    x = H(k+2,k+1);
    y = H(k+3,k+1);
    if k<n-3
        z = H(k+4,k+1);
    end
end
[v,beta] = House([x;y]);
H(n-1:n,n-2:n) = H(n-1:n,n-2:n) - (beta*v)*(v'*H(n-1:n,n-2:n));
H(1:n,n-1:n) = H(1:n,n-1:n) - (H(1:n,n-1:n)*v)*(beta*v)';