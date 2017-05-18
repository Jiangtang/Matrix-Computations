m = 5;
n = 3;
k = 4;

C = randi( [-2,2], m, n )
A = randi( [-2,2], m, k )
B = randi( [-2,2], k, n )

% Compute A * B + C via MatMatMult
Gemm_unb_var2( A, B, C )

% Compute A * B + C
A * B + C

% Check if they compute the same
if ( isequal( Gemm_unb_var2( A, B, C ), A * B + C ) )
    disp( 'it appears Gemm_unb_var2 computes correctly' )
else
    disp( 'Gemm_unb_var2 has a problem' )
end

