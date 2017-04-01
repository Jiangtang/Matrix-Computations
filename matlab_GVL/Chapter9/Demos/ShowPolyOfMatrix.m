  function ShowPolyOfMatrix()
% function ShowPolyOfMatrix()
% Horner's method for polynomials in a matrix.
% GVL4: Section 9.2.4
clc
fprintf('Horner''s method for polynomials in a matrix\n\n')
n = 1000;
q = 17;
b = randn(q,1);
[A,R] = qr(randn(n,n));
I = eye(n,n);
% Fully exploiting Horner's rule requires 6 matrix multiplies...
tic
A2 = A*A;
A3 = A*A2;
A4 = A*A3;
B{1} = b(4) *A3 + b(3) *A2 + b(2) *A  + b(1)*I;
B{2} = b(8) *A3 + b(7) *A2 + b(6) *A  + b(5)*I;
B{3} = b(12)*A3 + b(11)*A2 + b(10)*A  + b(9)*I;
B{4} = b(17)*A4 + b(16)*A3 + b(15)*A2 + b(14)*A + b(13)*I;
P = B{4};
P = A4*P + B{3};
P = A4*P + B{2};
P = A4*P + B{1};
t1 = toc;
% The conventional method involves 15 matrix multiplies...
tic
F = PolyM(A,b);
t2 = toc;
fprintf('Matrix Dimension  = %4d\n',n)
fprintf('Polynomial Degree = %1d\n',q-1)
fprintf('Time(Conventional)/Time(Fully Horner) = %6.3f\n',t2/t1)

  function F = PolyM(A,b)
% function F = PolyM(A,b)
% Polynomial of a matrix.
% A nxn and b is a length-(q+1) vector with q>=2.
% F = b(1)I + b(2)A + b(3)A^2 + ... + b(q+1)A^q
% GVL4: Algorithm 9.2.1
n = length(A);
q = length(b)-1;
F = b(q+1)*A + b(q)*eye(n,n);
for k=q-1:-1:1
    F = A*F + b(k)*eye(n,n);
end