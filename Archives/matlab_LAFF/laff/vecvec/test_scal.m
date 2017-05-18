% Create a vector and a scalar
x = [
1
2
3
]
alpha = -2

% test with x column vector
disp( 'scale column vector' )
if ( isequal( laff_scal( alpha, x ), alpha * x ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test with x row vector
disp( 'scale row vector' )
if ( isequal( laff_scal( alpha, x' ), alpha * x' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test with illegal alpha
alpha = [
    1 2
    3 4
    ];
disp( 'illegal alpha' )
if ( isequal( laff_scal( alpha, x ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test with illegal x
x = [
    2 3
    -1 -2
    ];
alpha = 2;
disp( 'illegal x' )
if ( isequal( laff_scal( alpha, x ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end
