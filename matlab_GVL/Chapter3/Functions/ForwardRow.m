  function x = ForwardRow(L,b)
% function x = ForwardRow(L,b)
% Forward elimination (row-oriented version)
% L is nxn, lower triangular, and nonsingular. 
% b is nx1 and x solves Lx = b.
% GVL4: Algorithm 3.1.1
n = length(b);
for i=1:n
    b(i) = (b(i) - L(i,1:i-1)*b(1:i-1))/L(i,i);
end
x = b;