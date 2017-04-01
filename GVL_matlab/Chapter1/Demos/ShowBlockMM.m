  function ShowBlockMM()
% function ShowBlockMM()
% Illustrates block matrix multiplication using a cell array
% data structure for block matrices.
% GVL4: Section 1.3

for eg=1:10
   % The block widths...
   m = ceil(10*(1+rand(1,ceil(5*rand(1,1)))));
   p = ceil(10*(1+rand(1,ceil(5*rand(1,1)))));
   n = ceil(10*(1+rand(1,ceil(5*rand(1,1)))));
   % The row and column widths of A are defined by m and p
   A = randn(sum(m),sum(p)); Ablock = MakeBlock(A,m,p);
   % The row and column widths of B are defined by p and n
   B = randn(sum(p),sum(n)); Bblock = MakeBlock(B,p,n);
   % The row and column widths of C are defined by m and n
   C = randn(sum(m),sum(n)); Cblock = MakeBlock(C,m,n);
   % Carry out the MM two different ways and compare..
   C1 = C + A*B;
   C1block = BlockMMProd(Cblock,Ablock,Bblock);
   clc
   m=m, p=p, n=n
   err = norm(Block2Conventional(C1block) - C1);
   fprintf('Error in BlockMMProd = %10.3e\n',err)
   pause(1)
end

  function Ablock = MakeBlock(A,m,n)
% m is a length-M vector of positive integers
% n is a length-N vector of positive integers
% A is a sum(m)-by-sum(n) matrix.
% Ablock is an M-by-N cell array with the property that
% Ablock{i,j} is the ij block of A given the row and column
% partitioning defined by m and n.
M = length(m);
N = length(n);
Ablock = cell(M,N);
for i=1:M
    idx = sum(m(1:i-1))+1:sum(m(1:i));
    for j=1:N
        jdx = sum(n(1:j-1))+1:sum(n(1:j));
        Ablock{i,j} = A(idx,jdx);
    end
end

  function A = Block2Conventional(Ablock)
% A is the conventionally stored version of the block matrix Ablock
[M,N] = size(Ablock);
A = [];
for i=1:M
    % "Add in" the ith block row...
    Arow = [];
    for j=1:N
        Arow = [Arow Ablock{i,j}];
    end
    A = [A;Arow];
end

  function C1 = BlockMMProd(C,A,B)
% C, A, and B are block matrices that are conformably partitioned and
% C1 is is a block matrix such that C1 = C + A*B.

% Confirm that the blockings are conformable...
[M,P] = size(A);
for i=1:M
    [m(i),alfa] = size(A{i,1});
end
for j=1:P
    [alfa,p(j)] = size(A{1,j});
end
[Q,N]= size(B);
for i=1:Q
    [q(i),alfa] = size(B{i,1});
end
for j=1:N
    [alfa,n(j)] = size(B{1,j});
end
[MC,NC] = size(C);
for i=1:MC
    [mc(i),alfa] = size(C{i,1});
end
for j=1:NC
    [alfa,nc(j)] = size(C{1,j});
end
conformable = (length(m)==length(mc) && sum(m-mc)==0) && ...
              (length(n)==length(nc) && sum(n-nc)==0) && ...
              (length(p)==length(q ) && sum(p-q)==0);
if conformable 
   % Proceed with the multiplication...
   for i=1:MC
      for j=1:NC
         for k=1:P
            C{i,j} = C{i,j} + A{i,k}*B{k,j};
         end
      end
   end
else
   disp('Blockings not conformable.')
end
C1 = C;
    
