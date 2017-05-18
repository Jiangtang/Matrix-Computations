% Create a vector
x = [
1
2
3
]

% test with x column vector, comparing against matlab's norm function
disp( 'compute length of column vector' )
if ( isequal( laff_norm2( x ), norm( x ) ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED.  But could this be due to roundoff?  Lets check:' )
    disp( 'laff_norm2( x ):' )
    disp( laff_norm2( x ) )
    disp( 'norm( x, 2 ):' )
    disp( norm( x, 2 ) )
end

disp( ' ' )

% test with x row vector, comparing against matlab's norm function
disp( 'compute length of row vector' )
if ( isequal( laff_norm2( x' ), norm( x ) ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED  But could this be due to roundoff?  Lets check:' )
    disp( 'laff_norm2( trans(x) ):' )
    disp( laff_norm2( x' ) )
    disp( 'norm( x, 2 ):' )
    disp( norm( x, 2 ) )
end

disp( ' ' )

% test with illegal x
x = [
    2 3
    -1 -2
    ];

disp( 'illegal x' )
if ( isequal( laff_norm2( x ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end
