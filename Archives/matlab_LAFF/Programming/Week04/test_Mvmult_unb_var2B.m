A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )
y = randi( [ -2, 2 ], 4, 1 )

if ( isequal( Mvmult_n_unb_var2B( A, x, y ), A * x + y ) )
    disp( 'Mvmult_unb_var2B appears to be correct' )
else
    disp( 'Mvmult_unb_var2B has a problem' )
end

