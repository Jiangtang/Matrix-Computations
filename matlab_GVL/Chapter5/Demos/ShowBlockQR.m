  function ShowBlockQR()
% function ShowBlockQR()
% Comnpares two block methods for the QR factorization
clc
m = 1024;
fprintf('Benchmark Two Different Block QR Procedures\n\n')
disp('  m     n      r  time(BlockHouse)  time(RecurBlock)')
disp('--------------------------------------------------')
for n = [256 512 1024]
   A = randn(m,n);
   for r = [4 8 16 32 64]
      tic
      [Q,R] = BlockHouseQR(A,r);
      tHouse = toc;
      tic
      [Q,R] = RecursiveBlockQR(A,r);
      tRecur = toc;
      fprintf('%4d  %4d  %4d  %10.3f  %15.3f\n',m,n,r,tHouse,tRecur)
   end
end
fprintf('\n\nNote that the recursive version produces the thin QR factorization\n')
fprintf('while the Block Householder does not (in our implementation).\n\n')
