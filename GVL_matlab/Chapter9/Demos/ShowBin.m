  function ShowBin()
% function ShowBin()
% Compares PowerM to repeated matrix multiplication.
% GVL4: Section 9.2.5
clc
n = 1000; [A,R] = qr(randn(n,n));
fprintf('Powers of a Matrix\n\n')
fprintf('A^s where A is n-by-n\n\n')

% Example 1.
s = 63; tic, F = PowerM(A,s); t1M = toc;
tic
F1 = A;
for k=2:s
    F1 = F1*A;
end
t1 = toc;
fprintf('n = %4d,  s = %3d,  time(Conventional)/time(PowerM) = %6.3f\n',n,s,t1/t1M)
% Example 2
s = 64; tic, F = PowerM(A,s); t2M = toc;
tic
F1 = A;
for k=2:s
    F1 = F1*A;
end
t2 = toc;
fprintf('n = %4d,  s = %3d,  time(Conventional)/time(PowerM) = %6.3f\n',n,s,t2/t2M)


    