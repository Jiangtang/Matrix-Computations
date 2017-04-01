  function ShowPerfShuff()
% function ShowPerfShuff()
% Explicitly displays a couple of perfect shuffle permutation
% matrices.
% GVL4: Section 1.2.11

clc
I = eye(6,6);
v = PerfShuff(2,3);
P2_3 = I(v,:);
disp('P(2,3) = ')
fprintfM('  %1d',P2_3)

I = eye(9,9);
v = PerfShuff(3,3);
P3_3 = I(v,:);
disp('P(3,3) = ')
fprintfM('  %1d',P3_3)




