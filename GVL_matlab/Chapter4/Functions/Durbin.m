  function y = Durbin(r)
% function y = Durbin(r)
% Yule-Walker system solver.
% r is nx1 such that T = toeplitz([1;r(1:n-1)]) is positive definite
% y is nx1 and solves Ty = -r(n-1:-1:1)
% GVL4: Algorithm 4.7.1
n = length(r); 
y = zeros(n,1); 
z = zeros(n,1);
y(1) = -r(1); 
beta = 1; 
alfa = -r(1);
for k=1:n-1
    beta     = (1 - alfa^2)*beta;
    alfa     = -(r(k+1)+r(k:-1:1)'*y(1:k))/beta;
    z(1:k)   = y(1:k) + alfa*y(k:-1:1);
    y(1:k+1) = [z(1:k);alfa];
end