  function ShowStrass()
% Examines the flops associated with Strassen Matrix Multiplication
% GVL4: Algorithm 1.3.1
clc 
disp('nmin    n = 1024    2048    4096    8182   16364')
disp('--------------------------------------------------') 
for nmin = [1 2 4 8 16 32 64] 
   if nmin>1
      fprintf('\n  %2d:   ',nmin) 
   else
      fprintf('  %2d:   ',nmin) 
   end
   for n = [1024  2048  4096  8182  16364];
      N = StrassFlops(n,nmin);
      fprintf('   %5.3f',N/(2*n^3))
   end   
end
fprintf('\n\n   Strassen Flops / Conventional Flops\n\n')

function N = StrassFlops(n,nmin)
if n<=nmin
    N = 2*n^3;
else
    m = n/2;
    N = 7*StrassFlops(m,nmin)+18*m^2;
end