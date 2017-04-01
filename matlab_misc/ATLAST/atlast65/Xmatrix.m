function X=Xmatrix(n)
% The command X=Xmatrix(n) generates
% a matrix of 0's and 1's whose nonzero
% entries are in the form a letter X,
% that is, the main diagonal and the
% anti-diagonal consist entirely of 1's
% and the remaining entries of the
% matrix are all 0.
X=eye(n)|fliplr(eye(n));
