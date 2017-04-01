  function ShowMatPowers()
% function ShowMatPowers()
% Displays high powers of a 2x2 matrix A with the
% property that A^k --> 0. Uses 6-digit FP arithmetic.
A = fl6([.85  10  100; 0 .92 20 ; 0 0 .91]);
F = A;
for k=1:400
    clc
    fprintf('A^%1d = \n',k)
    fprintfM('%13.6f',Value6(F))
    disp('     =')
    fprintfM_Sci('%10.6f',Value6(F))
    pause(.1)
    F = MM6(A,F);
end
