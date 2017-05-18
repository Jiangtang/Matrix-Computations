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

% test dot product of column vector with column vector
disp( 'dot product of column vector with column vector' )
if ( isequal( laff_dot( x, y ), x' * y ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test dot product of column vector with row vector
disp( 'dot product of column vector with row vector' )
if ( isequal( laff_dot( x, y' ), x' * y ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test dot product of row vector with column vector
disp( 'dot product of row vector with column vector' )
if ( isequal( laff_dot( x', y ), x' * y ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test dot product of row vector with row vector
disp( 'dot product of row vector with row vector' )
if ( isequal( laff_dot( x', y' ), x' * y ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test dot product of column vector with column vector (wrong size)
disp( 'dot product of column vector with column vector (wrong size)' )
if ( isequal( laff_dot( x, z ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test dot product of column vector with row vector (wrong size)
disp( 'dot product of column vector with row vector (wrong size)' )
if ( isequal( laff_dot( x, z' ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test dot product of row vector with column vector (wrong size)
disp( 'dot product of row vector with column vector (wrong size)' )
if ( isequal( laff_dot( x', z ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end

disp( ' ' )

% test dot product of row vector with row vector (wrong size)
disp( 'dot product of row vector with row vector (wrong size)' )
if ( isequal( laff_dot( x', z' ), 'FAILED' ) ) 
    disp( 'TEST PASSED' )
else
    disp( 'TEST FAILED' )
end