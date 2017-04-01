  function ShowHouseHessTri()
% function ShowHouseHessTri()
% Reduction to Hessenberg-Triangular form via Householder
% GVL4: Algorithm 7.7.1
clc
fprintf('Householder Reduction to Hessenberg-Triangular Form\n\n')
n = 4;
A = randn(n,n);
B = randn(n,n);
[Q,Z,H,T] = HouseHessTri(A,B);
fprintf('A = \n')
fprintfM('%7.3f',A)
fprintf('B = \n')
fprintfM('%7.3f',B)
fprintf('Q = \n')
fprintfM('%7.3f',Q)
fprintf('Z = \n')
fprintfM('%7.3f',Z)
fprintf('H = \n')
fprintfM('%7.3f',H)
fprintf('T = \n')
fprintfM('%7.3f',T)
fprintf('|| Q''AZ - H || = %10.3e\n',norm(Q'*A*Z - H))
fprintf('|| Q''BZ - T || = %10.3e\n',norm(Q'*B*Z - T))
fprintf('|| Q''Q - I  || = %10.3e\n',norm(Q'*Q - eye(n,n)))
fprintf('|| Z''Z - I  || = %10.3e\n',norm(Z'*Z - eye(n,n)))

