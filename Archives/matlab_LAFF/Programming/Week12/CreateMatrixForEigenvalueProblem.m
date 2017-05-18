function [ A, V ] = CreateMatrixForEigenvalueProblem( eigs )
% Given a column vector eigs with desired eigenvalues, this routine creates
%   a diagonalizable matrix A with eigenvalues eigs, and matrix V the columns
%   of which equal normalized eigenvectors corresponding to the given
%   eigenvalues, in order.  

% extract the number of eigenvalues
n = size( eigs, 1 );

% create a random matrix that is n x n.  Almost surely, it is nonsingular.
V = rand( n, n );

% normalize the columns of V to have norm 1
for i=1:n
    V( :, i ) = V( :, i ) / norm( V ( :, i ) );
end

% Set A = V * diag( x ) * inv( V ) so that the columns of V equal the
% eigenvectors of A corresponding to the eigenvalues, in order.
A = V * diag( eigs ) / V;

end

