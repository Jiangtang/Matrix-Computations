  function ShowBlockTridiagSol()
% function ShowBlockTridiagSol()
% Illustrates the solution of a block tridiagonal system using
% block LU
% Set up an NxN block tridiagonal matrix with qxq blocks...
N = 8;
q = 5;
D = cell(N,1);
b = cell(N,1);
for i=1:N
    D{i} = rand(q,q); D{i} = D{i}+3*q*eye(q,q);
    b{i} = rand(q,1);
end
E = cell(N-1,1); F = cell(N-1,1);
for i=1:N-1
    E{i} = rand(q,q);
    F{i} = rand(q,q);
end
% Block factorization...
[L,U] = BkTridiagLU(D,E,F);
% Block forward elimination...
y     = BkForwardSub(L,b);
% Block back substitution...
x     = BkBackwardSub(U,F,y);
% Compute the residual...
resid = 0;
for i=1:N
    v = D{i}*x{i};
    if i<N 
        v = v + F{i}*x{i+1};
    end
    if i>1
        v = v + E{i-1}*x{i-1};
    end
    resid = resid + norm(v-b{i});
end
clc
fprintf('Block Tridiagonal System Solve\n\n')
fprintf('||Tx - b|| = %10.3e\n\n',resid)
Lmat = eye(N*q,N*q);
Umat = zeros(N*q,N*q);
for i=1:N
    rows = 1+(i-1)*q:i*q;
    for j=1:N
        cols = 1+(j-1)*q:j*q;
        if i==j+1
            Lmat(rows,cols) = L{j};
        elseif i==j
            Umat(rows,cols) = U{i};
        elseif i==j-1
            Umat(rows,cols) = F{i};
        end
    end
end
subplot(1,3,1)
spy(sparse(Lmat*Umat),5)
title('T')
subplot(1,3,2)
spy(sparse(Lmat),5)
title('L')
subplot(1,3,3)
spy(sparse(Umat),5)
title('U')
shg



  function [L,U] = BkTridiagLU(D,E,F)
% function [L,U] = BkTridiagLU(D,E,F)
% Block LU factorization of a block tridiagonal matrix
% A is a block tridiagonal matrix with qxq blocks. 
% Assume that A has an LU factorization.
% D{1},...,D{N}   are the diagonal blocks of A
% E{1},...,E{N-1} are the subdiagonal blocks of A
% F{1},...,F{N-1} are ths superdiagonal blocks of A
% The lower trianglar factor is unit block lower bidiagonal with
%    subdiagonal blocks L{1},...,L{N-1}.
% The upper triangular factor is block upper bidiagonal with
%    diagonal blocks U{1},...,U{N} and superdiagonal blocks 
%    F{1},...,F{N-1}.
% GVL4: Section 4.5

N = length(D);
U = cell(N,1);
L = cell(N-1,1);
U{1} = D{1};
for i=2:N
    L{i-1} = (U{i-1}'\E{i-1}')';
    U{i} = D{i} - L{i-1}*F{i-1};
end

  function y = BkForwardSub(L,b)
% function y = BkForwardSub(L,b)
% Block unit lower bidiagonal solve.
% b is Nx1 cell array with qx1 cells
% L is an (N-1)x1 cell array with qxq blocks.
% y is an Nx1 cell array with qx1 cells such that b{1} = y{1} and
%       b{i} = L{i-1}y{i-1} + y{i}  i=2:N.
% GVL4: Section 4.5
N = length(b);
y = cell(N,1);
y{1} = b{1};
for i=2:N
    y{i} = b{i} - L{i-1}*y{i-1};
end

  function x = BkBackwardSub(U,F,y)
% function y = BkBackwardSub(U,F,b)
% Block upper bidiagonal solve.
% y is Nx1 cell array with qx1 cells
% U is an Nx1 cell array with qxq blocks, all nonsingular.
% F is an (N-1)x1 cell array with qxq blocks
% y is an Nx1 cell array with qx1 cells such that U{N}x{N}} = y{N} and
%       y{i} = U{i}x{i} + F{i}x{i+1}   i=N-1:-1:1
% GVL4: Section 4.5
N = length(y);
x = cell(N,1);
x{N} = U{N}\y{N};
for i=N-1:-1:1
    x{i} = U{i}\(y{i} - F{i}*x{i+1});
end

