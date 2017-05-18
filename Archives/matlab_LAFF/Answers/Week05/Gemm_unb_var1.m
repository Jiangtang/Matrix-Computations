function [ C_out ] = Gemm_unb_var1( A, B, C )

  [ BL, BR ] = FLA_Part_1x2( B, ...
                               0, 'FLA_LEFT' );

  [ CL, CR ] = FLA_Part_1x2( C, ...
                               0, 'FLA_LEFT' );

  while ( size( BL, 2 ) < size( B, 2 ) )

    [ B0, b1, B2 ]= FLA_Repart_1x2_to_1x3( BL, BR, ...
                                         1, 'FLA_RIGHT' );

    [ C0, c1, C2 ]= FLA_Repart_1x2_to_1x3( CL, CR, ...
                                         1, 'FLA_RIGHT' );

    %------------------------------------------------------------%

    c1 = laff_gemv( 'No transpose', 1, A, b1, 1, c1 );

    %------------------------------------------------------------%

    [ BL, BR ] = FLA_Cont_with_1x3_to_1x2( B0, b1, B2, ...
                                           'FLA_LEFT' );

    [ CL, CR ] = FLA_Cont_with_1x3_to_1x2( C0, c1, C2, ...
                                           'FLA_LEFT' );

  end

  C_out = [ CL, CR ];

return


