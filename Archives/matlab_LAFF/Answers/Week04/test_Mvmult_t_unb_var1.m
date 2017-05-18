A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )
y = randi( [ -2, 2 ], 4, 1 )

if ( isequal( Mvmult_t_unb_var1( A, x, y ), A' * x + y ) )
    disp( 'Mvmult_t_unb_var1 appears to be correct' )
else
    disp( 'Mvmult_t_unb_var1 has a problem' )
end

