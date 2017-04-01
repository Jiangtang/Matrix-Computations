function A=hconsec(n)
% The command A=hconsec(n) will generate an nxn matrix whose 
% entries in each row are consecutive integers. The first
% entry in each row is the same as the number of the row.
% Thus the first row will be [1, 2, ..., n], the second row 
% will be [2,3, ..., n+1], etc. For example the command 
% hconsec(4) will generate the matrix
%
%                1   2   3   4
%                2   3   4   5
%                3   4   5   6
%                4   5   6   7  
A=hankel([1:n]',[n:2*n-1]);
