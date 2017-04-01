  function B = Trench(r)
% function B = Trench(r)
% Inverse of a symmetric positive definite Toeplitz matrix.
% r is nx1 such that T = toeplitz([1;r(1:n-1)]) is positive definite
% B is the inverse of T.
% GVL4: Algorithm 4.7.3
n = length(r);
y = Durbin(r(1:n-1));
B = zeros(n,n);
gamma = 1/(1+r(1:n-1)'*y(1:n-1));
v(1:n-1) = gamma*y(n-1:-1:1);
B(1,1) = gamma;
B(1,2:n) = v(n-1:-1:1)';
for i=2:floor((n-1)/2)+1
    for j=i:n-i+1
        B(i,j) = B(i-1,j-1)+(v(n+1-j)*v(n+1-i) - v(i-1)*v(j-1))/gamma;
    end
end
% Fill in the rest of B using the fact that it is both symmetric
% and persymmetric...
for i=1:n
    for j=i+1:n
        B(j,i) = B(i,j);
    end
end
for i=1:n
    for j=1:n-i+1
        B(n-i+1,n-j+1) = B(i,j);
    end
end