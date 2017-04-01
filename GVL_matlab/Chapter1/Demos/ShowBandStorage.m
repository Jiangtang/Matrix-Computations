  function ShowBandStorage()
% function ShowBandStorage()
% Illustrates a band matrix data structure and a gaxpy
% computation that lives off of it.
% GVL4: Section 1.2.5.
clc
n = 10; p = 3; q = 2;
A = RandomBand(n,n,p,q);
disp('Matrix A conventionally stored... ')
fprintfM('  %6.2f',A)
B = MakeBand(A,p,q);
disp('Matrix A stored in band format... ')
fprintfM('  %6.2f',B.band)
% BandGaxpy check...
y = randn(n,1); 
x = randn(n,1);
% Compute y + Ax two different ways...
yConventional = y+A*x;
yViaBandGaxpy = BandGaxpy(y,B,x);
err = norm(yConventional - yViaBandGaxpy);
fprintf('\n\n|| yConventional - yViaBandGaxpy || = %6.1e\n',err)

  function B = MakeBand(A,p,q)
% Stores a conventionally represented band matrix in band format.
% A is (nxn) with lower bandwidth p and upper bandwidth q.
[n,n] = size(A);
B = struct('n',n,'p',p,'q',q','band',zeros(p+q+1,n));
for i=1:n
   for j=1:n
      if i-j<=p && j-i<=q
         B.band(i-j+q+1,j) = A(i,j);
      end
   end
end

  function y1 = BandGaxpy(y,A,x)
% Band Gaxpy
% A is (nxn) and stored in band format.  
% x is (nx1) and y is (mx1).
% y1 = y + A*x
n = A.n; p = A.p; q = A.q;
for j=1:n
    alfa1 = max(1,j-q);
    alfa2 = min(n,j+p);
    beta1 = max(1,q+2-j);
    beta2 = beta1+alfa2-alfa1;
    y(alfa1:alfa2) = y(alfa1:alfa2) + A.band(beta1:beta2,j)*x(j);
end
y1 = y;

  function A = RandomBand(m,n,p,q)
% Generates a random mxn matrix with lower bandwidth p and 
% upper bandwidth q.
A = randn(m,n); 
A = tril(A,q); 
A = triu(A,-p);





