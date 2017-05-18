function [ A_out, b_out ] = Solve( A, b )
%  Solves A x = b

LU = LU_unb_var5( A );

z = Ltrsv_unb_var1( LU, b );

x = Utrsv_unb_var1( LU, z );

A_out = LU;

b_out = x;

end

