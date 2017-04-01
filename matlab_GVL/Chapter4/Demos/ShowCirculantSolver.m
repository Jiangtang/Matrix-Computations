  function ShowCirculantSolver()
% function ShowCirculantSolver()
% Benchmarks CirculantSolver confirming that it is O(n log n).
clc
fprintf('Circulant system solving in O(n log n)...\n\n')
disp('      n      Time  ')
disp('---------------------')
n = 1024;
for k=1:11
   z = randn(n,1) + sqrt(-1)*randn(n,1);
   y = randn(n,1) + sqrt(-1)*randn(n,1);
   repeatFactor = ceil(10^7/n);
   tic 
   for k=1:repeatFactor
      x = CirculantSolver(z,y);
   end
   t =toc/repeatFactor;
   fprintf('%7d  %8.5f\n',n,t)
   n =2*n;
end