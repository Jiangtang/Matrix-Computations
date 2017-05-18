function T = tridiag(a, b, c, n)

% tridiag  Tridiagonal matrix.
% T = tridiag(a, b, c, n) returns an n by n matrix that has 
% a, b, c as the subdiagonal, main diagonal, and superdiagonal 
% entries in the matrix.

T = b*diag(ones(n,1)) + c*diag(ones(n-1,1),1) + a*diag(ones(n-1,1),-1);



%{
function retval = Tridiag(n,a,b,c)
# usage: Tridiag(n,a,b,c)
# description: returns tridiagonal matrix with diags a,b,c of size n

# local variables:
# ii,jj: index variables

retval = zeros(n,n);
retval(1,1) = b;
retval(1,2) = c;
retval(n,n-1) = a;
retval(n,n) = b;
for ii = 2:(n-1)
  retval(ii,ii-1) = a;
  retval(ii,ii) = b;
  retval(ii,ii+1) = c;
endfor;

endfunction
%}