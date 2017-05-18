% Create some vectors
x = [
1
2
3
]
y = [
0
-1
-2
]
z = [
4
3
2
1
]

% Create a scalar
alpha = -2

% test column - column axpy
disp( 'column - column axpy' )
if ( isequal( laff_axpy( alpha, x, y ), alpha * x + y ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test column - row axpy
disp( 'column - row axpy' )
if ( isequal( laff_axpy( alpha, x, y' ), alpha * x' + y' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test row - column axpy
disp( 'row - column axpy' )
if ( isequal( laff_axpy( alpha, x', y ), alpha * x + y ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test row -> row axpy
disp( 'row -> row axpy' )
if ( isequal( laff_axpy( alpha, x', y' ), alpha * x' + y' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test column - column axpy (wrong size)
disp( 'column - column axpy (wrong size)' )
if ( isequal( laff_axpy( alpha, x, z ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test column - row axpy (wrong size)
disp( 'column - row axpy (wrong size)' )
if ( isequal( laff_axpy( alpha, x, z' ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test row -> column (wrong size)
disp( 'row -> column (wrong size)' )
if ( isequal( laff_axpy( alpha, x', z ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test row -> row axpy (wrong size)
disp( 'row -> row axpy (wrong size)' )
if ( isequal( laff_axpy( alpha, x', z' ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end