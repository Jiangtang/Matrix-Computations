function A=consec(n)
% The command A=consec(n) will generate an nxn matrix whose 
% entries are the consecutive integers from 1 to n^2. The 
% first row will be [1, 2, ..., n], the second row will be 
% [n+1, n+2, ..., 2n], etc. For example the command consec(3) 
% will generate the matrix
%
%            1  2  3
%            4  5  6
%            7  8  9
A=reshape([1:n^2],n,n)';
