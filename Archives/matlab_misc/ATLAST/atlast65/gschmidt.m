function [Q,R]=gschmidt(A,classic)
% The Gram-Schmidt QR factorization of a matrix A. If
% [Q R] = gschmidt(A), then Q and R are the matrices
% derived from the modified Gram-Schmidt process, i.e.,
% the column vectors of Q form an orthonormal basis for
% the column space of A and R is a square upper triangular 
% matrix such that A = QR.
% To compute the QR factorization using the classical version
% of the Gram-Schmidt process use the command [Q R]=gschmidt(A,1).
% The classical version, however, may not be numerically stable.
% The preferred method to compute an orthonormal basis is to
% use the orth command.
[m,n]=size(A); R=zeros(n);
if rank(A)~=n
   error('Column vectors are not linearly independent')
end
if nargin == 1   % Modified Gram-Schmidt
   Q=A;
   for k=1:n;
       R(k,k)=norm(Q(:,k)); 
       Q(:,k)=Q(:,k)/R(k,k);
       R(k,k+1:n)=Q(:,k)'*Q(:,k+1:n);
       Q(:,k+1:n)=Q(:,k+1:n)-Q(:,k)*R(k,k+1:n);
   end
else           % Classical Gram-Schmidt
   R(1,1)=norm(A(:,1));
   Q(:,1)=A(:,1)/R(1,1);
   for k=2:n
       R(1:k-1,k)=Q(:,1:k-1)'*A(:,k);
       Q(:,k)=A(:,k)-Q(:,1:k-1)*R(1:k-1,k);
       R(k,k)=norm(Q(:,k));
       Q(:,k)=Q(:,k)/R(k,k);
   end
end
