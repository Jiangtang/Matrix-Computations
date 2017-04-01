  function x = BandBackSub(U,q,b)
% function x = BandBackSub(U,q,b)
% Band upper triangular system solver.
% U is nxn, nonsingular, and upper triangular with upper bandwidth q.
% b is nx1 and x solves Ux = b.
% GVL4: Algorithm 4.3.3
n = length(U);
for j=n:-1:1
    b(j) = b(j)/U(j,j);
    for i=max(1,j-q):j-1
        b(i) = b(i) - U(i,j)*b(j);
    end
end
x = b;