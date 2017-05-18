function A=diffmat(n)
% The command A=diffmat(n) will generate an
% nxn matrix whose (i,j) entry is |i-j|.
A=toeplitz([0:n-1]);
