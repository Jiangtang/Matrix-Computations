  function ShowFP_Thinker()
% function ShowFP_Thinker()
% Illustrates the Three Floating Point Maxims
% GVL4: Section 2.7.4
clc
fprintf('Maxim 1: Order is Important.\n\n')
x = fl6(1.23456);
y = fl6(-1.23455);
z = fl6(.000001);
a1 = Add6(Add6(x,y),z);
a2 = Add6(x,Add6(y,z));
disp('fl6(fl6(x+y)+z) = ')
fprintfM_Sci('%10.5f',Value6(a1))
disp('fl6(x+fl6(y+z)) = ')
fprintfM_Sci('%10.5f',Value6(a2))

fprintf('\n\nMaxim 2: Larger May Mean Smaller.\n\n')
x = pi/3;
disp('If x = pi/3, then sin''(x) = cos(x) = 1/2.')
disp('Using divided differences:')
disp(' ')
disp('     h      (sin(x+h)-sin(x))/h     error')
disp('-------------------------------------------')
for h=logspace(-1,-15,15)
    divdiff = (sin(x+h)-sin(x))/h;
    fprintf('%10.2e  %18.15f   %10.2e\n',h,divdiff,abs(divdiff-1/2))
end
    
fprintf('\n\nMaxim 3: A Math Book is Not Enough.\n\n')
p = 12345678;
q = 1;
fprintf('Find smaller root of x^2-2px-q=0 where\n')
fprintf('    p = %25.15f\n    q = %25.15f\n\n',p,q)
fprintf('If we use the formula rmin = p - sqrt(p^2 + q), then\n')
fprintf('\n   rmin =  %20.15e\n\n',p - sqrt(p^2+q)) 
fprintf('If we use the formula rmin = -q/(p + sqrt(p^2 + q)), then\n')
fprintf('\n   rmin =  %20.15e\n\n',-q/(p + sqrt(p^2+q)))
