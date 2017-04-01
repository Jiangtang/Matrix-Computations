  function x = ForwardCol(L,b)
% function x = ForwardCol(L,b)
% Forward elimination (column-oriented version)
% L is nxn, lower triangular, and nonsingular. 
% b is nx1 and x solves Lx = b.
% GVL4: Algorithm 3.1.3
n = length(b);
for j=1:n
    b(j) = b(j)/L(j,j);
    b(j+1:n) = b(j+1:n) - L(j+1:n,j)*b(j);
end
x = b;