  function ShowInverseIt()
% function ShowInverseIt()
% Illustrates the use of inverse iteration to compute all the eigenvectors
% of a matrix with real eigenvalues.
clc
fprintf('Inverse Iteration\n\n')
n = 6;
% Generate an example with well-conditioned eigenvectors...
A = tril(randn(n,n),-1) + diag(1:n);
% Compute Hessenberg decomposition...
[Q,H] = hess(A);
% Then the Schur decomposition without transformations...
T = schur(H);
D = diag(diag(T));
% Assemble the eigenvectors in X...
X = zeros(n,n);
for k=1:n
    % Use 1 step of inverse iteration to get the kth eigenvector of H...
    q0 = randn(n,1);
    v = InverseIt(H,T(k,k),q0,1);
    % Transform to get the corresponding eigenvector for A...
    X(:,k) = Q*v;
end
disp('A = '), fprintfM('%11.6f',A)
disp('X = '), fprintfM('%11.6f',X)
disp('D = '), fprintfM('%11.6f',D)
disp('AX-XD = '), fprintfM_Sci('%7.4f',A*X-X*D)


