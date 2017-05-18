A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )

if ( isequal( Trmv_un_unb_var1( A, x ), triu( A ) * x  ) )
    disp( 'Trmv_un_unb_var1 appears to be correct' )
else
    disp( 'Trmv_un_unb_var1 has a problem' )
end

