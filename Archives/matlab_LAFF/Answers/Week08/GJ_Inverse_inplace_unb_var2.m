function [ A_out ] = GJ_Inverse_inplace_unb( A )

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    %------------------------------------------------------------%

    a01 = laff_invscal( -alpha11, a01 );   
    
    a21 = laff_invscal( -alpha11, a21 );   
    
    A00 = laff_ger( 1, a01, a10t, A00 );   A02 = laff_ger( 1, a01, a12t, A02 );

    A20 = laff_ger( 1, a21, a10t, A20 );   A22 = laff_ger( 1, a21, a12t, A22 );

    a12t = laff_invscal( alpha11, a12t );
    
    a10t = laff_invscal( alpha11, a10t );
    
    alpha11 = laff_invscal( alpha11, 1. );
    
    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );
                                         
  end
  A_out = [ ATL, ATR
            ABL, ABR ];

return

