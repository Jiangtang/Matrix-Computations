  function ShowSSQR()
% function ShowSSQR()
% Illustrates the efficeint computation of the QR factorization of
% a semiseparable matrix.
% GVL4: Section 12.2.7

% Generate an example...
n = 6;
u = randn(n,1);
v = randn(n,1);
p = randn(n,1);
q = (u.*v)./p
A0 = tril(u*v') + triu(p*q',1);
b = randn(n,1);
% Compute its QR factorization...
[c,s,f,g,h,q] = SSQR(u,v,p,q);
% Explicitly form Q and R and check...
Q = eye(n,n);
for k=1:n-1
    Q(k:k+1,:) = [c(k) s(k); -s(k) c(k)]'*Q(k:k+1,:);
end
R = triu(f*g'+h*q');
% Display results...
clc
fprintf('QR Factorization of a Semiseparable Matrix\n\n')
fprintf('A = \n')
fprintfM('%10.3f',A0)
fprintf('Q = \n')
fprintfM('%10.3f',Q)
fprintf('|| Q''Q - I || = %10.3e\n\n',norm(Q'*Q - eye(n,n)))
fprintf('R = \n')
fprintfM('%10.3f',R)
fprintf('|| A - QR || = %10.3e\n',norm(A0 - Q*R))
% Solve Ax = b. First apply Q' to b...
for k=n-1:-1:1
    b(k:k+1) = [c(k) s(k); -s(k) c(k)]*b(k:k+1);
end
% Solve Rx = Updated b...
x =  Rank2Backsolve(f,g,h,q,b);
x0 = triu(f*g' + h*q')\b;
fprintf('|| x - inv(A)*b || = %10.3e\n\n',norm(x - x0))


  function [c,s,f,g,h,q] = SSQR(u,v,p,q)
% function [c,s,f,g,h,q] = SSQR(u,v,p,q)
% u,v,p, and q are nx1.
% f,g,h, and q are nx1.
% c and s are (n-1)-by-1 and c.^2+s.^2 = 1
% If A = tril(uv') + triu(pq',1) and u.*v = p.*q and u(n)~=0,
% then A = QR where R = triu(fg'+hq') and Q' = G_{1}*...G_{n-1}
% G_{k} = diag(eye(k-1,k-1),[c(k) s(k); -s(k) c(k)],eye(n-k-1,n-k-1)).
% GVL4: Algorithm 12.2.2
      
n = length(p);
c = zeros(n,1);
s = zeros(n,1);
f = zeros(n,1);
g = zeros(n,1); 
h = zeros(n,1);
f(n) = u(n);
g(n) = v(n);
for k=n-1:-1:1
   % -s(k)*u(k) + c(k)*u(k+1) = 0
   s(k)   = u(k+1)/sqrt(u(k)^2+u(k+1)^2);
   c(k)   = u(k)  /sqrt(u(k)^2+u(k+1)^2);
   u(k)   = c(k)*u(k) + s(k)*u(k+1);
   alfa   = f(k+1); 
   f(k)   = s(k)*alfa; 
   f(k+1) = c(k)*alfa;
   beta   = h(k+1); 
   h(k)   = c(k)*p(k) + s(k)*beta; 
   h(k+1) = -s(k)*p(k) + c(k)*beta;
   g(k)   = (u(k)*v(k)-h(k)*q(k))/f(k);  
end

  function x = Rank2Backsolve(f,g,h,q,b)
% function x = Rank2Backsolve(f,g,h,q,b)
% f,g,h,q,b are nx1. If U = triu(fg'+hq') is nonsingular,
% then Ux = b.
% GVL4: Section 12.2.7
n = length(b);
x = zeros(n,1);
x(n) = b(n)/(f(n)*g(n)+h(n)*q(n));
alfa = g(n)*x(n);
beta = q(n)*x(n);
for k=n-1:-1:1
    x(k) = (b(k) - f(k)*alfa - h(k)*beta)/(f(k)*g(k) + h(k)*q(k));
    alfa = alfa + g(k)*x(k);
    beta = beta + q(k)*x(k);
end