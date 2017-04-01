  function ShowFastPoisson()
% Illustrates 2D Fast Poisson solving with various boundary conditions
n1 = 32; In1 = eye(n1,n1);
n2 = 16; In2 = eye(n2,n2);
b = randn(n1*n2,1);
type={'DD','DN','ND','NN'};
clc
disp('  T1    T2    ||uFast - uSlow|| ')
disp('-------------------------------------')
for i=1:4
    for j=1:4
        if ~(i==4 && j==4)
           uFast = FastPoisson(n1,type{i},n2,type{j},b);
           uSlow = SlowPoisson(n1,type{i},n2,type{j},b);
           fprintf('  %s    %s   %14.3e\n',type{i},type{j},norm(uFast-uSlow))
        end
    end
end
% Benchmark for n = 256, 512, and 1024...
b256  = randn(256*256,1);
b512  = randn(512*512,1);
b1024 = randn(1024*1024,1);
fprintf('\n\n\n')
disp('  T1    T2    Time(256)  Time(512)  Time(1024) ')
disp('---------------------------------------------------')
for i=1:4
    for j=1:4
        if ~(i==4 && j==4)
           tic
           uFast = FastPoisson(256,type{i},256,type{j},b256);
           t256 = toc;
           tic
           uFast = FastPoisson(512,type{i},512,type{j},b512);
           t512 = toc;
           tic
           uFast = FastPoisson(1024,type{i},1024,type{j},b1024);
           t1024 = toc;
           fprintf('  %s    %s    %6.3f      %6.3f     %6.3f \n',type{i},type{j},t256,t512,t1024)
        end
    end
end





