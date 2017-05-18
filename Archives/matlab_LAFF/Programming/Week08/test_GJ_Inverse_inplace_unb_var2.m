% We are going to take a bit of a risk, and start with a random matrix A
% with integer values...  There is no guarantee that it is invertible
% without pivoting, or invertible at all... 

A = randi( [-9,9], 4, 4 );

Ainv = GJ_Inverse_inplace_unb_var2( A );

disp( 'The below should equal approximately the identity:' )

Ainv * A

disp( 'Note: if the above shows "NaN", this means that the Gauss-Jordan' )
disp( 'algorithm encountered a divide by zero, resulting in a "Not a Number"' )
disp( 'Just execute this script again, and see if you get luckier...' )


