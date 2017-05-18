A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )

if ( isequal( Trmv_ln_unb_var2( A, x ), tril( A ) * x  ) )
    disp( 'Trmv_ln_unb_var2 appears to be correct' )
else
    disp( 'Trmv_ln_unb_var2 has a problem' )
end

