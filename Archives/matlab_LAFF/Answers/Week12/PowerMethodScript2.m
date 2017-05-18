format long

% Choose the maximum number of iterations of the power method that will be performed. 
k = 20;

% Choose the eigenvalues
disp( 'input a vector of eigenvalues. e.g.: [ 4; 3; 2; 1 ]   ' );
eigs = input('');

% Make sure that the first entry is equal to largest in absolute value
[ eig_max ] = max( abs( eigs( 2:n ) ) );
if eig_max > abs( eigs( 1 ) )
    disp( 'The first entry should be equal to largest in absolute value.' );
    break;
end

% extract the number of eigenvalues
n = size( eigs, 1 );


disp( 'Now we set the second eigenvalue equal to the negative of the ' );
disp( 'first one' );

eigs( 2 ) = -eigs( 1 );

[ A, V ] = CreateMatrixForEigenvalueProblem( eigs );

disp( 'Matrix A:' )
disp( A );

% Print V
disp( 'Matrix of eigenvectors:' );
disp( V );

% Print eigenvalues
disp( 'Eigenvalues:' );
disp( eigs );

input( 'hit return to continue' );

% Create a random initial vector x, and normalize it to have unit length
x = rand( n, 1 );
x = x / norm( x );

disp( 'Initial random vector:' )
disp( x )

disp( 'iteration' );
disp( 0 );
    
% Compute the Rayleigh quotient (no need to divide by x' * x since x is
% of unit length)
disp( 'Rayleigh quotient:' );
disp( x' * A * x );

cont = 1;  % (continue = YES)

% Perform at most k steps of the power method
for i=1:k
    cont = input( 'continue? (0=NO, return = YES)' );
    if cont == 0
        break;
    end
    
    disp( 'iteration' );
    disp( i );
    
    % Next step of Power Method
    x = A * x;
    x = x / norm( x );
    
    % Print the length of the component of x orthogonal to the eigenvector
    % associated with the largest eigenvalue (in magnitude)
    disp( 'The length of the component of x orthogonal to V( :, 1 ) is ' );
    disp( norm( x - x' * V( :, 1 ) * V( :, 1 ) ) );
    
    % Compute the Rayleigh quotient (no need to divide by x' * x since x is
    % of unit length)
    disp( 'Rayleigh quotient: (notice that this doesnt converge)' );
    disp( x' * A * x );
    
    % Print the length of the component of x orthogonal to the eigenvector
    % associated with the largest eigenvalue (in magnitude)
    disp( 'The length of the component of x orthogonal to the spaces ' );
    disp( ' spanned by V( :, 1 ) and V( :, 2 ) is ' );
    disp( norm( x - ...
        V( :, 1:2 ) * inv( V( :, 1:2 )' * V( :, 1:2 ) ) * V( :, 1:2 )' * x ) );

end

