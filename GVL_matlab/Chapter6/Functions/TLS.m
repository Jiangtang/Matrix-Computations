  function x = TLS(A,b,d,t)
% function x = TLS(A,b,d,t)
% Total least squares.
% A is mxn with m>n,b is mx1, d is mx1 and positive, and t is (n+1)x1
% and positive.
% x is nx1 and satisfies (A+E)x = b +r subject to the constraint
% that || diag(d)*[A b]*diag(t) ||_{F} is minimized.
% Assumes that a solution exists.
[m,n] = size(A);
C = diag(d)*[A b]* diag(t);
[U,S,V] = svd(C);
x = zeros(n,1);
for i=1:n
    x(i) = -t(i)*V(i,n+1)/(t(n+1)*V(n+1,n+1));
end