  function ShowThinCS()
% function ShowThinCS()
% Illustrates the Thin CS Decomposition.
clc
fprintf('The Thin CS Decomposition\n\n')
fprintf('The case when Q2 is tall...\n')
m1 = 6; m2 = 5; n1 = 4; [Q,R] = qr(randn(m1+m2,n1),0);
Q1 = Q(1:m1,:); Q2 = Q(m1+1:m1+m2,:);
[U1,U2,V,C,S] = ThinCS(Q1,Q2);
fprintf('\nQ1 = ')
fprintfM('%7.3f',Q1)
fprintf('\nQ2 = ')
fprintfM('%7.3f',Q2)
fprintf('C (diagonal) = ')
fprintfM('%10.6f',C)
fprintf('S (diagonal) = ')
fprintfM('%10.6f',S)
fprintf('U1 (orthogonal) = ')
fprintfM('%7.3f',U1)
fprintf('U2 (orthogonal) = ')
fprintfM('%7.3f',U2)
fprintf('V (orthogonal) = ')
fprintfM('%7.3f',V)
fprintf('|| Q1 - U2*C*V'' || = %10.3e\n',norm(Q1 - U1*C*V'))
fprintf('|| Q2 - U2*S*V'' || = %10.3e\n',norm(Q2 - U2*S*V'))
fprintf('||  U1''U1 - I   || = %10.3e\n',norm(U1'*U1 - eye(m1,m1)))
fprintf('||  U2''U2 - I   || = %10.3e\n',norm(U2'*U2 - eye(m2,m2)))
fprintf('||   V''V - I    || = %10.3e\n',norm(V'*V - eye(n1,n1)))

fprintf('\nThe case when Q2 is wide...\n')
m1 = 6; m2 = 2; n1 = 4; [Q,R] = qr(randn(m1+m2,n1),0);
Q1 = Q(1:m1,:); Q2 = Q(m1+1:m1+m2,:);
[U1,U2,V,C,S] = ThinCS(Q1,Q2);
fprintf('\nQ1 = ')
fprintfM('%7.3f',Q1)
fprintf('\nQ2 = ')
fprintfM('%7.3f',Q2)
fprintf('C (diagonal) = ')
fprintfM('%10.6f',C)
fprintf('S (diagonal) = ')
fprintfM('%10.6f',S)
fprintf('U1 (orthogonal) = ')
fprintfM('%7.3f',U1)
fprintf('U2 (orthogonal) = ')
fprintfM('%7.3f',U2)
fprintf('V (orthogonal) = ')
fprintfM('%7.3f',V)
fprintf('|| U1''Q1*V - C'' || = %10.3e\n',norm(U1'*Q1*V - C))
fprintf('|| U2''Q2*V - S'' || = %10.3e\n',norm(U2'*Q2*V - S))
fprintf('||  U1''U1 - I   || = %10.3e\n',norm(U1'*U1 - eye(m1,m1)))
fprintf('||  U2''U2 - I   || = %10.3e\n',norm(U2'*U2 - eye(m2,m2)))
fprintf('||   V''V - I    || = %10.3e\n',norm(V'*V - eye(n1,n1)))
    




