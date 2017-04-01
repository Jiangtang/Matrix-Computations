  function ShowMM_Error()
% function ShowMM_Error()
% Error in 6-digit floating point matrix-matrix multiplication.
% GVL section 2.7.8
clc
% fl6 unit roundoff...
eps6 = .000005;
% A 3x3 random example...
n = 3; A = randn(3,3); B = randn(3,3); 
% The "exact" product...
C = A*B;
% The fl6 product..
C_hat = MM6(fl6(A),fl6(B));
% The error matrix...
E = abs(C - Value6(C_hat));
disp('The error matrix |C - fl6(A*B)| = ')
fprintfM_Sci('%10.6f',E)
% The alleged bound on the error matrix...
Bound = n*eps6*abs(A)*abs(B);
disp('The bound is given by n*eps6*|A|*|B| = ')
fprintfM_Sci('%10.6f',Bound)


