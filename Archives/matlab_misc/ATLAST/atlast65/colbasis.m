function C = colbasis(A)
% COLBASIS(A) is a matrix whose columns form a basis
% for the column space of A. The basis is obtained from
% the reduced row echelon form of A.
[R,jp] = rref(A);
C = A(:,jp);
