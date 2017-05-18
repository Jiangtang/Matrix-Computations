  function ShowSkewHam()
% function ShowSkewHam()
% Example of structured matrix computations involving the reduction of
% a Skew-Hamiltonian matrix to a 2-by-2 block upper triangular form 
% using orthogonal symplectic similarity transformations.
clc
n = 10;
% Generate a 2n-by-2n Skew-Hamiltonian matrix...
A = randn(n,n);
F = randn(n,n); F = (F-F')/2;
G = randn(n,n); G = (G-G')/2;
N = [A G; F A'];
fprintfM('%7.2f',[A G;F A']) 
% Compute its eigenvalues...
lambda = eig(N); [z,idx] = sort(real(lambda)); lambda = lambda(idx);
% Now compute A1 and G1 where Q'*N*Q = [A1 G1; 0 A1'] and Q is
% orthogonal and symplectic. 
for k=1:n-1
    % A is upper Hessenberg through its first k-1 columns.
    % F(k:n,k:n) is the nonzero part of F
    if k<=n-2
       % Zero F(k+2:n,k)...
       [v,beta] = House(F(k+1:n,k)); 
       % Update A 
       A(k+1:n,k:n)= A(k+1:n,k:n) - (beta*v)*(v'*A(k+1:n,k:n)); 
       A(:,k+1:n) = A(:,k+1:n) - (A(:,k+1:n)*v)*(beta*v)';
       % Update F exploiting skew-symmetry...
       u = [0;v];
       S = F(k:n,k:n); w = S*u; F(k:n,k:n) = S - beta*(w*u'-u*w');
       % Update G exploiting skew-symmetry...
       T = G(k:n,k:n); w = T*u; G(k:n,k:n) = T - beta*(w*u'-u*w');
       G(k:n,1:k-1) = G(k:n,1:k-1) - (beta*u)*(u'*G(k:n,1:k-1));
       G(1:k-1,k:n) = -G(k:n,1:k-1)'; 
    end
    % Zero F(k+1,k) and F(k,k+1)...
    [c,s] = Givens(A(k+1,k),F(k+1,k));
    % Perform the update N <-- Q'*N*Q where Q = [Q1 Q2;-Q2 Q1],
    % Q1 = I + (c-1)zz', Q2 = szz', and z = I(,k+1).
    % This requires the following vectors:
    %          d = Az  e = A'*z  f = Fz  g = Gz
    d = A(:,k+1); e = A(k+1,:)'; f = F(:,k+1);  g = G(:,k+1);
    % To make things simple...
    z = zeros(n,1); z(k+1) = 1;
    % NewA = Q1*A*Q1 - Q1*G*Q2 - Q2*F*Q1 + Q2*A'*Q2
    %      = A + (c-1)ze' + (c-1)dz' + 2(1-c)A(k+1,k+1)zz' - sgz' + szf'
    A = A + (c-1)*z*e' + (c-1)*d*z' + 2*(1-c)*A(k+1,k+1)*z*z' - s*g*z' + s*z*f';
    % NewF = Q2*A*Q1 - Q2*G*Q2 + Q1*F*Q1 - Q1*A'*Q2
    %      = F - (c-1)zf' + (c-1)fz' + sze' - sez'
    F = F - (c-1)*z*f' + (c-1)*f*z' + s*(z*e'-e*z');
    % NewG = Q1*A*Q2 + Q1*G*Q1 - Q2*F*Q2 - Q2*A'*Q1
    %      = G - (c-1)zg' + (c-1)gz' + sdz' - szd'
    G = G - (c-1)*z*g' + (c-1)*g*z' + s*d*z' - s*z*d';
    % Note: these 3 updates can be made much more efficient.
    if k<=n-2
       % Zero A(k+2:n,k)...
       [v,beta] = House(A(k+1:n,k)); 
       % Update A 
       A(k+1:n,k:n)= A(k+1:n,k:n) - (beta*v)*(v'*A(k+1:n,k:n)); 
       A(:,k+1:n) = A(:,k+1:n) - (A(:,k+1:n)*v)*(beta*v)';
       % Update F exploiting skew-symmetry...
       u = [0;v];
       S = F(k:n,k:n); w = S*u; F(k:n,k:n) = S - beta*(w*u'-u*w');
       % Update G exploiting skew-symmetry...
       T = G(k:n,k:n); w = T*u; G(k:n,k:n) = T - beta*(w*u'-u*w');
       G(k:n,1:k-1) = G(k:n,1:k-1) - (beta*u)*(u'*G(k:n,1:k-1));
       G(1:k-1,k:n) = -G(k:n,1:k-1)'; 
    end
    fprintfM('%7.2f',[A G;F A'])  
end
clc
fprintf('Check the final A, F, and G...\n\n')
fprintf('|| A - triu(A,-1) || = %10.2e\n',norm(A - triu(A,-1),'fro'))
fprintf('             || F || = % 10.2e\n',norm(F,'fro'));
fprintf('        || G + G'' || = %10.2e\n\n',norm(G+G','fro'));
fprintf('Compare the  eigenvalues of the initial and final N...\n\n')
fprintf('       eig(N)             eig(NewN)  \n')
fprintf('------------------------------------------------------------\n')
lambda1 = eig([A G;F A']); [z,idx] = sort(real(lambda1)); lambda1 = lambda1(idx);
disp([lambda lambda1])
