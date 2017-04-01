  function [A,B] = FrancisQZStep(A0,B0)
% function [A,B] = FrancisQRStep(A0,B0)
% A0 is an unreduced upper Hessenberg matrix.
% B0 is a nonsingular upper triangular matrix.
% A is the upper Hessenberg matrix  and B is an upper triangular matrix
% that results when one step of the QZ algorithm is applied.
% GVL4: Algorithm 7.7.2

A = A0;
B = B0;
n = length(A);
if n<=2
    return
end
m = n-1;
% Define M = A*inv(B)
% Compute the first column of (M-a*I)(M-b*I)) = M^2 -(a+b)M + abI where
% a and b are the eigenvalues of M1, the lower 2x2 of M.
B1inv = inv(B(m-1:n,m-1:n));
M1 = A(m:n,m-1:n)*B1inv(:,2:3);
s = M1(1,1)+M1(2,2);
t = M1(1,1)*M1(2,2) - M1(1,2)*M1(2,1);
FirstCol = (A(1:3,1:2)*[B(1:2,1:2)\A(1:2,1)]-s*A(1:3,1))/B(1,1)+[t;0;0];
x = FirstCol(1); 
y = FirstCol(2); 
z = FirstCol(3);
% Chase the bulge...
for k=1:n-2
    [v,beta] = House([x;y;z]);
    q = max(1,k-1);
    A(k:k+2,q:n) =  A(k:k+2,q:n) - (beta*v)*(v'*A(k:k+2,q:n));
    B(k:k+2,k:n) =  B(k:k+2,k:n) - (beta*v)*(v'*B(k:k+2,k:n));
    [v,beta] = HouseRev(B(k+2,k:k+2)');
    q = min(k+3,n);
    A(1:q,k:k+2) = A(1:q,k:k+2) - (A(1:q,k:k+2)*v)*(beta*v)';
    B(1:k+2,k:k+2) = B(1:k+2,k:k+2) - (B(1:k+2,k:k+2)*v)*(beta*v)';
    [v,beta] = HouseRev(B(k+1,k:k+1)');
    A(1:q,k:k+1)   = A(1:q,k:k+1)   - (A(1:q,k:k+1)*v)*(beta*v)';
    B(1:k+2,k:k+1) = B(1:k+2,k:k+1) - (B(1:k+2,k:k+1)*v)*(beta*v)';
    x = A(k+1,k);
    y = A(k+2,k);
    if k+3<=n
        z = A(k+3,k);
    end
end
[v,beta] = House([x;y]);
A(n-1:n,n-2:n) = A(n-1:n,n-2:n) - (beta*v)*(v'*A(n-1:n,n-2:n));
B(n-1:n,n-1:n) = B(n-1:n,n-1:n) - (beta*v)*(v'*B(n-1:n,n-1:n));
[v,beta] = HouseRev(B(n,n-1:n)');
A(1:n,n-1:n) = A(1:n,n-1:n) - (A(1:n,n-1:n)*v)*(beta*v)';
B(1:n,n-1:n) = B(1:n,n-1:n) - (B(1:n,n-1:n)*v)*(beta*v)';


  function [v,beta] = HouseRev(x)
% Householder vector computation where all but the bottom component
% of x is zeroed.
% x is a column m-vector.
% v is a column m-vector with v(m) = 1 and beta is a scalar such
% that P = I - beta*v*v' is orthogonal and Px = norm(x)*em.
m = length(x);
[v,beta] = House(x(m:-1:1));
v = v(m:-1:1);