  function x = ForwardRow6(L,b)
% function x = ForwardRow6(L,b)
% Forward elimination with fl6 arithmetic
% L is nxn, lower triangular, nonsingular and in 6-digit FP format. 
% b is nx1 and in 6-digit FP format. x is an 6-digit FP vector that
% approximately solves Lx = b.
% GVL4: Algorithm 3.1.1 
n = length(b);
for i=1:n
    b(i) = Div6(Sub6(b(i),Dot6(L(i,1:i-1),b(1:i-1))),L(i,i));
end
x = b;

