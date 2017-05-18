  function ShowOrthogReps()
% function ShowOrthogReps()
% Illustrates three different ways to represent  certain products
% of Householder matrices.
clc
fprintf('Three Ways to Represent Certain Householder Products\n\n')
A = randn(7,3);
[Q_fact,R] = HouseQR(A);
fprintf('The factored form representation of Q_{1}Q_{2}_Q{3}:\n')
fprintfM('%7.3f',Q_fact)
fprintf('If [v_{1} v_{2} v_{3}] = \n')
fprintfM('%7.3f',Q_fact+eye(7,3))
fprintf('then Q_{j} = I-alfa_{j}v_{j}v_{j}''  alfa_{j} = 2/(v_{j}''v_{j})\n\n')
Q = BackAccum(Q_fact);
fprintf('The explicit representation of Q = Q_{1}Q_{2}Q_{3} : \n')
fprintfM('%7.3f',Q)
[W,Y] = WY(Q_fact);
fprintf('In WY representation, Q = I - WY'' where:\n\n')
fprintf('W = ')
fprintfM('%7.3f',W)
fprintf('Y = ')
fprintfM('%7.3f',Y)