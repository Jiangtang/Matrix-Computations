% Copyright 2018 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Jiangtang Hu
%                jiangtanghu@gmail.com
% Testing:
% M = randi(5,4)
% Set_to_zero_unb_var1(M)
% zeros(size(M))

function [ A_out ] = Set_to_zero_unb_var1( A )

  [ AL, AR ] = FLA_Part_1x2( A, ...
                             0, 'FLA_LEFT' );

  while ( size( AL, 2 ) < size( A, 2 ) )

    [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                           1, 'FLA_RIGHT' );

    %------------------------------------------------------------%

    a1 = laff_zerov( a1 );

    %------------------------------------------------------------%

    [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                           'FLA_LEFT' );

  end

  A_out = [ AL, AR ];

return
