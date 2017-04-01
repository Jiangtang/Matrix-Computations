  function x = BackCol(U,b)
% function x = BackCol(U,b)
% Back Substitution (column-oriented version).
% U is nxn, upper triangular, and nonsingular. 
% b is nx1 and x solves Ux = b.
% GVL4: Algorithm 3.1.4
n = length(b);
for j=n:-1:1
    b(j) = b(j)/U(j,j);
    b(1:j-1) = b(1:j-1) - U(1:j-1,j)*b(j);
end
x = b;