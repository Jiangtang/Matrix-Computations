  function C = Strass(A,B,n,nmin)
% function C = Strass(A,B,n,nmin)
% Strassen matrix multiplication.
% GVL4: Algorithm 1.3.1
% A and B are nxn and n is a power of two and nmin is a positive integer.
% C = A*B
if floor(log2(n))~=log2(n)
   error('n must be an integral  power of two')
end 
if n<=nmin
   % Base case. Use conventional algorithm...
   C = A*B;
else
   % Partition A and B into 2-by-2 block matrices
   % and invoke the Strassen recursion...
   m = n/2; u = 1:m; v=m+1:n;
   P1 = Strass(A(u,u)+A(v,v),B(u,u)+B(v,v),m,nmin);
   P2 = Strass(A(v,u)+A(v,v),B(u,u),m,nmin);
   P3 = Strass(A(u,u),B(u,v)-B(v,v),m,nmin);
   P4 = Strass(A(v,v),B(v,u)-B(u,u),m,nmin);
   P5 = Strass(A(u,u)+A(u,v),B(v,v),m,nmin);
   P6 = Strass(A(v,u)-A(u,u),B(u,u)+B(u,v),m,nmin);
   P7 = Strass(A(u,v)-A(v,v),B(v,u)+B(v,v),m,nmin);
   C = zeros(n,n);
   C(u,u) = P1 + P4 - P5 + P7;
   C(u,v) = P3 + P5;
   C(v,u) = P2 + P4;
   C(v,v) = P1 + P3 - P2 + P6;
end
