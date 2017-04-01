  function ShowQRUpdates()
% function ShowQRUpdates()
% Illustrates five update situations given A = QR.
clc
fprintf('Various Updates of a QR Factorization\n\n')
m = 6;
n = 4;
A0 = randn(m,n);
[Q0,R0] = qr(A0);
fprintf('A0 = ')
fprintfM('%7.3f',A0)
fprintf('Q0 = ')
fprintfM('%7.3f',Q0)
fprintf('R0 = ')
fprintfM('%7.3f',R0)

fprintf('\n+++++++++++++++++++++++++++++++++++++++++++++++++++\n')
fprintf('\nGeneral Rank-1 Update: A0+uv'' = QR\n\n')
u = randn(m,1); v = randn(n,1);
fprintf('u = ')
fprintfM('%7.3f',u)
fprintf('v = ')
fprintfM('%7.3f',v)
[Q,R] = Rank1Update(Q0,R0,u,v);
fprintf('|| (A0+uv'') - QR || = %10.3e\n',norm(A0+u*v'-Q*R))
fprintf('|| Q''Q - I ||       = %10.3e\n',norm(Q'*Q - eye(m,m)))
fprintf('|| R - triu(R) ||   = %10.3e\n',norm(R - triu(R)))

fprintf('\n+++++++++++++++++++++++++++++++++++++++++++++++++++\n')
fprintf('\nAdd-a-Column Update: [A0(:,1:k) z A0(:,k+1:n)] = QR\n\n')
z = randn(m,1);
k = floor((n+1)*rand(1,1));
fprintf('z = ')
fprintfM('%7.3f',z)
fprintf('k = %1d\n',k)
[Q,R] = AddColQR(Q0,R0,k,z);
A = [A0(:,1:k) z A0(:,k+1:n)];
fprintf('|| [A0(:,1:k) z A0(:,k+1:n)] - QR || = %10.3e\n',norm(A-Q*R))
fprintf('|| Q''Q - I ||                        = %10.3e\n',norm(Q'*Q - eye(m,m)))
fprintf('|| R - triu(R) ||                    = %10.3e\n',norm(R - triu(R)))

fprintf('\n+++++++++++++++++++++++++++++++++++++++++++++++++++\n')
fprintf('\nDelete-a-Column Update: [A0(:,1:k-1) A0(:,k+1:n)] = QR\n\n')
k = ceil(n*rand(1,1));
[Q,R] = DeleteColQR(Q0,R0,k);
A = [A0(:,1:k-1) A0(:,k+1:n)];
fprintf('k = %1d\n',k)
fprintf('|| [A0(:,1:k-1) A0(:,k+1:n)] - QR || = %10.3e\n',norm(A-Q*R))
fprintf('|| Q''Q - I ||                        = %10.3e\n',norm(Q'*Q - eye(m,m)))
fprintf('|| R - triu(R) ||                    = %10.3e\n',norm(R - triu(R)))

fprintf('\n+++++++++++++++++++++++++++++++++++++++++++++++++++\n')
fprintf('\nAdd-a-Row Update: [A(1:k,:); w''; A(k+1:m,:)] = QR\n\n')
w = randn(n,1);
k = floor((m+1)*rand(1,1));
fprintf('w = ')
fprintfM('%7.3f',w)
[Q,R] = AddRowQR(Q0,R0,k,w);
A = [A0(1:k,:); w'; A0(k+1:m,:)];
fprintf('k = %1d\n',k)
fprintf('|| [A0(1:k,:); w''; A0(k+1:n,:)] - QR || = %10.3e\n',norm(A-Q*R))
fprintf('|| Q''Q - I ||                           = %10.3e\n',norm(Q'*Q - eye(m+1,m+1)))
fprintf('|| R - triu(R) ||                       = %10.3e\n',norm(R - triu(R)))

fprintf('\n+++++++++++++++++++++++++++++++++++++++++++++++++++\n')
fprintf('\nDelete-a-Row Update: [A0(1:k-1,:) A0(k+1:m,:)] = QR\n\n')
k = ceil(m*rand(1,1));
[Q,R] = DeleteRowQR(Q0,R0,k);
A = [A0(1:k-1,:); A0(k+1:m,:)];
fprintf('k = %1d\n',k)
fprintf('|| [A0(1:k-1,:); A0(k+1:m,:)] - QR || = %10.3e\n',norm(A-Q*R))
fprintf('|| Q''Q - I ||                         = %10.3e\n',norm(Q'*Q - eye(m-1,m-1)))
fprintf('|| R - triu(R) ||                     = %10.3e\n',norm(R - triu(R)))








