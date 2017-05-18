  function ShowSSLU()
% function ShowSSLU()  
% Illustrates how to compute and use the LU factorization of a
% semiseparable matrix.
% GVL4: Sections 12.2.1-12.2.5

% Generate an example...
n = 6;
A = randnSS(n);
% Compute L and U and check...
[L,U] = SSLU(A);
L0 = FullSS(L);
U0 = FullSS(U);
A0 = FullSS(A);
clc
fprintf('LU of a Semiseparable Matrix\n\n')
fprintf('A = \n')
fprintfM('%10.3f',A0)
fprintf('L = \n')
fprintfM('%10.3f',L0)
fprintf('U = \n')
fprintfM('%10.3f',U0)
fprintf('|| A - LU || = %10.3e\n',norm(A0-L0*U0))
% Solve a system and check...
b = randn(n,1);
y0 = L0\b;
y = SSL_Solve(L.u,L.v,L.t,b);
x0 = U0\y0;
x = SSU_Solve(U.p,U.q,U.r,y);
fprintf('|| x - inv(A)b || = %10.3e\n',norm(x - x0))

  function A = MakeQS(u,v,t,d,p,q,r)
% function A = MakeQS(u,v,t,d,p,q,r)
% u,v,d,p,q are column n-vectors
% t,r are column (n-1)-vectors
% A is the quasiseparable representation of the matrix
%
%    tril(uv',-1).*inv(B(t))' + diag(d) + triu(pq',1).*inv(B(r))
%
% GVL4: Section 12.2.3
A = struct('u',u,'v',v,'t',t,'d',d,'p',p,'q',q,'r',r);

  function Afull = FullSS(A)
% function Afull = FullSS(A)
% Converts a matrix in quasiseparable form to conventional array form.
u = A.u; v = A.v; t = A.t; d = A.d; p = A.p; q = A.q; r = A.r;
Afull = tril(u*v',-1).*inv(B(t)') + diag(d) + triu(p*q',1).*inv(B(r));

  function C = B(tau)
% function C = B(tau)
% The unit upper bidiagonal matrix with superdiagonal -tau
% tau is (n-1)x1
% C is nxn unit upper bidiagonal with superdiagonal = -tau
n = length(tau)+1;
C = eye(n,n) + diag(-tau,1);
for i=n:n-1
    C(i,i+1) = -tau(i);
end
       
  function A = randnSS(n)
% function A = randnSS(n)
% Constructs a random nxn semiseparable matrix
u = 1+ floor(10*rand(n,1)); 
v = 1+ floor(10*rand(n,1));
t = randn(n-1,1)
r = randn(n-1,1);
p = randn(n,1);
q = randn(n,1);
p = p.*(u.*v)./(p.*q);
A = MakeQS(u,v,t,u.*v,p,q,r);

  function [L,U] = SSLU(A)
% function [L,U] = SSLU(A)
% A is a semiseparable matrix represented in quasiseparable form.
% Assume A has an LU factorization.
% A = LU where L is unit lower triangular and U is upper triangular,
% both represented in quasiseparable form.

% Take A apart...
u = A.u; v = A.v; t = A.t; p = A.p; q = A.q; r = A.r;
% Set up L....
n = length(u);
e = ones(n,1);
tau = t.*u(2:n)./u(1:n-1);
L = MakeQS(e,e,tau,e,zeros(n,1),zeros(n,1),zeros(n-1,1));
% Set up U...
ptilde = [p(1); p(2:n)-tau.*p(1:n-1).*r];
U = MakeQS(zeros(n,1),zeros(n,1),zeros(n-1,1),ptilde.*q,ptilde,q,r);

  function x = SSU_Solve(p,q,r,b)
% function x = SSU_Solve(p,q,r,b)
% p,q, and b are nx1
% r is (n-1)-by-1
% x solves Ux = b where U = triu(pq').*inv(B(t))
n = length(b);
x = zeros(n,1);
b = b./p;
x(n) = b(n);
for k=n-1:-1:1
    x(k) = b(k) - r(k)*b(k+1);
end
x = x./q;

  function x = SSL_Solve(u,v,t,b)
% function x = SSL_Solve(u,v,t,b)
% u,v, and b are nx1
% t is (n-1)-by-1
% x solves Lx = b where L = tril(uv').*inv(B(t)) 
n = length(b);
x = zeros(n,1);
b = b./u;
x(1) = b(1);
for k=2:n
    x(k) = b(k) - t(k-1)*b(k-1);
end
x = x./v;