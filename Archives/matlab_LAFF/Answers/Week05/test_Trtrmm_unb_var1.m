U = randi( [-2,2], 4, 4 );
R = randi( [-2,2], 4, 4 );
C = randi( [-2,2], 4, 4 );

Cout = Trtrmm_unb_var1( U, R, C );

% Now, remember that only the upper triangular part changed.  So,
% tril( Cout,-1 ) should equal tril( C,-1 ) and triu( Cout ) should equal 
% triu( U ) * triu( R )

if ~isequal( tril( Cout, -1 ), tril( C, -1 ) )
    
    disp( 'TROUBLE: The lower triangular part of C was corrupted' ) 
    
elseif ~isequal( triu( Cout ), triu( U ) * triu( R ) )
    
    disp( 'TROUBLE: The lower triangular part of C was corrupted' )
    
else
    
    disp( 'Trtrmm_unb_var1 appears to give the right answer' )
    
end