  function x = Levinson(r,b)
% function y = Levinson(r,b)
% Symmetric positive definite Toeplitz system solver.
% r is nx1 such that T = toeplitz([1;r(1:n-1)]) is positive definite and
%    b is nx1.
% x is nx1 and solves Tx = b.
% GVL4: Algorithm 4.7.2
n = length(b); 
y = zeros(n,1); 
v = zeros(n,1); 
z = zeros(n,1); 
x = zeros(n,1);
y(1)=-r(1); 
x(1) = b(1); 
beta = 1; 
alfa = -r(1);
for k=1:n-1
    beta = (1-alfa^2)*beta;
    mu = (b(k+1)-r(1:k)'*x(k:-1:1))/beta;
    v(1:k) = x(1:k)+ mu*y(k:-1:1);
    x(1:k+1) = [v(1:k);mu];
    if k<n-1
        alfa = -(r(k+1)+r(1:k)'*y(k:-1:1))/beta;
        z(1:k) = y(1:k) + alfa*y(k:-1:1);
        y(1:k+1) = [z(1:k);alfa];
    end
end