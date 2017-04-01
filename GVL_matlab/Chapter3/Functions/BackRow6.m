  function x = BackRow6(U,b)
% function x = BackRow6(U,b)
% Back-substitution with fl6 arithmetic
% U is nxn, upper triangular, nonsingular and in 6-digit FP format. 
% b is nx1 and in 6-digit FP format. x is a 6-digit FP vector that
% approximately solves Ux = b.
% GVL4: Algorithm 3.1.2 
n = length(b);
for i=n:-1:1
    b(i) = Div6(Sub6(b(i),Dot6(U(i,i+1:n),b(i+1:n))),U(i,i));   
end
x = b;
