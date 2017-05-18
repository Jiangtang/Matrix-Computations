A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )
y = randi( [ -2, 2 ], 4, 1 )

if ( isequal( Trmvp_ln_unb_var1( A, x, y ), tril( A ) * x + y ) )
    disp( 'Trmvp_ln_unb_var1 appears to be correct' )
else
    disp( 'Trmvp_ln_unb_var1 has a problem' )
end

