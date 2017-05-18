  function [d,F,G] = PrinAngles(A,B) 
% function [d,F,G] = PrinAngles(A,B)
% A and B are mxn matrices with n<=m.
% d is nx1 and d(i) = cos(theta(i)), i=1:n where theta(i) is the ith
%   principal angle between ran(A) and ran(B).
% The columns of F (mxn) and G (m,n) are the corresponding principal
%   vectors.
[QA,RA] = qr(A,0);
[QB,RB] = qr(B,0);
[Y,D,Z] = svd(QA'*QB);
F = QA*Y;
G = QB*Z;
d = diag(D);