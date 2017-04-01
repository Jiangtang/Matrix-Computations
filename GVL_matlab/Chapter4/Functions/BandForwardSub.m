  function x = BandForwardSub(L,p,b)
% function x = BandForwardSub(L,p,b)
% Band lower triangular system solve
% L is nxn, nonsingular, unit lower triangular with lower bandwidth p, and
%    b is nx1.
% x is nx1 and solves Lx = b.
% GVL4: Algorithm 4.3.2
n = length(L);
for j=1:n
    for i=j+1:min(j+p,n)
        b(i) = b(i) - L(i,j)*b(j);
    end
end
x = b;