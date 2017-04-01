  function x = BackRow(U,b)
% function x = BackRow(U,b)
% Back-Substitution (row-oriented version)
% U is nxn, upper triangular, and nonsingular. 
% b is nx1 and x solves Ux = b.
% GVL4: Algorithm 3.1.2
n = length(b);
for i=n:-1:1
    b(i) = (b(i) - U(i,i+1:n)*b(i+1:n))/U(i,i);
end
x = b;