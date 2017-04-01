  function ShowGSVD()
% function ShowGSVD()
% Illustrates the Generalized Singular Value Decomposition
% GVL4: Theorem 6.1.1

clc
fprintf('The Generalized Singular Value Decomposition\n\n')
fprintf('A and B both tall...\n')
m1 = 6; m2 = 5; n1 = 4; kappaA = 10^5; kappaB = 10^3;
A = gallery('randsvd', [m1,n1],kappaA,3);
B = gallery('randsvd', [m2,n1],kappaB,3);
[U1,U2,V,R,DA,DB] = VR_GSVD(A,B);
fprintf('\nA = ')
fprintfM('%7.3f',A)
fprintf('B = ')
fprintfM('%7.3f',B)
fprintf('DA (diagonal) = ')
fprintfM('%10.6f',DA)
fprintf('DB (diagonal) = ')
fprintfM('%10.6f',DB)
fprintf('U1 (orthogonal) = ')
fprintfM('%7.3f',U1)
fprintf('U2 (orthogonal) = ')
fprintfM('%7.3f',U2)
X = R\V;
fprintf('X (nonsingular) = ')
fprintfM_Sci('%7.3f',X)
fprintf('|| U1''AX - DA || = %10.3e\n',norm(U1'*A*X - DA))
fprintf('|| U2''BX - DB || = %10.3e\n',norm(U2'*B*X - DB))
fprintf('|| U1''U1 - I  || = %10.3e\n',norm(U1'*U1 - eye(m1,m1)))
fprintf('|| U2''U2 - I  || = %10.3e\n',norm(U2'*U2 - eye(m2,m2)))
fprintf('\ncond(X) = %10.3e\n',cond(X))

fprintf('\nA is tall and B is wide...\n')
m1 = 6; m2 = 3; n1 = 4; kappaA = 10^5; kappaB = 10^3;
A = gallery('randsvd', [m1,n1],kappaA,3);
B = gallery('randsvd', [m2,n1],kappaB,3);
[U1,U2,V,R,DA,DB] = VR_GSVD(A,B);
fprintf('\nA = ')
fprintfM('%7.3f',A)
fprintf('B = ')
fprintfM('%7.3f',B)
fprintf('DA (diagonal) = ')
fprintfM('%10.6f',DA)
fprintf('DB (diagonal) = ')
fprintfM('%10.6f',DB)
fprintf('U1 (orthogonal) = ')
fprintfM('%7.3f',U1)
fprintf('U2 (orthogonal) = ')
fprintfM('%7.3f',U2)
X = R\V;
fprintf('X (nonsingular) = ')
fprintfM_Sci('%7.3f',X)
fprintf('|| U1''AX - DA || = %10.3e\n',norm(U1'*A*X - DA))
fprintf('|| U2''BX - DB || = %10.3e\n',norm(U2'*B*X - DB))
fprintf('|| U1''U1 - I  || = %10.3e\n',norm(U1'*U1 - eye(m1,m1)))
fprintf('|| U2''U2 - I  || = %10.3e\n',norm(U2'*U2 - eye(m2,m2)))
fprintf('\ncond(X) = %10.3e\n',cond(X))

  function [U1,U2,V,R,DA,DB] = VR_GSVD(A,B)
% function [U1,U2,V,R,DA,DB] = VR_GSVD(A,B)
% A is m1xn1 with m1>=n1 and B is m2xn1 with m1+m2>=n1. 
% A = U1*C*(R'V)' and B = U2*S*(R'V)' where
%    U1 is m2xm2 and orthogonal
%    U2 is m1xm1 and orthogonal
%    V  is n1xn   and orthogonal
%    R  is n1xn1  and upper triangular
%    DA is m2xn1 and diagonal with non-increasing nonnegative diagonal entries
%    DB is m2xn1 has the form [zeros(m2,max(0,n1-m2)) DB1] where DB1 is 
%       diagonal with non-decreasing nonnegative diagonal entries.
% GVL4: Theorem 6.1.1 with X = inv(V'R) = R\V assuming that the nullspaces
%       of A and B intersect trivially.
% Note: The Matlab GSVD orders the diagonal of DA from little to big
% and the diagonal of DB from big to little. If we ignore that, then
% [U1,U2,X,DA,DB] = GSVD(A,B) returns X = R'V.
[m1,n1] = size(A);
[m2,n1] = size(B);
[Q,R] = qr([A;B],0);
[U1,U2,V,DA,DB] = ThinCS(Q(1:m1,:),Q(m1+1:m1+m2,:));


