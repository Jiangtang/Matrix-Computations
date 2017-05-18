  function lambda = Sturm(T,k)
% function lambda = Sturm(T,k)
% T is an nxn unreduced symmetric tridiagonal matrix and 1<=k<=n.
% lambda is the kth largest eigenvalue of T.
% GVL4: Section 8.4.2
z = norm(T,1);
y = -z;
n = length(T);
while abs(y-z)> 10*eps*(abs(y)+abs(z))
    x = (y+z)/2;
    if a(T,x)>n-k
        z = x;
    else
        y = x;
    end
end
lambda = (y+z)/2;

  function alfa = a(T,lambda)
% function alfa = a(T,lambda)
% T is an unreduced symmetric tridiagonal matrix and lambda is real.
% alfa is the number of eigenvalues that are less than alfa.
n = length(T);
p0 = 1; p1 = T(1,1)-lambda;
alfa = 0; s = 1;
if p1<=0
    alfa = 1; s = -s;
end  
for r=2:n
   pr = (T(r,r)-lambda)*p1 - p0*T(r,r-1)^2;
   if s*pr<=0
       alfa = alfa+1; s = -s;
   end
   p0 = p1; p1 = pr;
end


