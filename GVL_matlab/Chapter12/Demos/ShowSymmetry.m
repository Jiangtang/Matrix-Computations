  function ShowSymmetry()
% function ShowSymmetry()
% Illustrates (super) symmetry in a tensor.
% GVL4: Section 12.5.4

% Order...
d = 4;
% Dimension...
m = 3;
% Symmetric rank...
r = 5;
% Number of entries...
N = m^d;
% Generate...
n = m*ones(1,d);
A = random_sym_tensor(m,d,r);
% Display the entries clustering entries that have the same value
% due to symmetry...
clc
fprintf('A Symmetric Tensor...\n\n')
[z,idx] = sort(Vec(A));
nDistinct = 0;
for k=1:N
    j = idx(k);
    i = inv_col(j,n);
    if k>1 && abs(z(k)-z(k-1))>.0001
        fprintf('\n')
        nDistinct = nDistinct+1;
    end
    fprintf('A(')
    fprintf('%1d',i)
    fprintf(') = %10.6f\n',z(k))
end
fprintf('\n\n>>>>>>>>>>>>>>>>>>>>>\n\nOrder = %1d\n',d)
fprintf('Dimension = %1d\n',m)
fprintf('Distinct values = %1d\n\n',nDistinct)

  function A = random_sym_tensor(m,d,r)
% function A = random_sym_tensor(m,d,r)
% m, d, and r are positive integers
% A is a symmetric order-d tensor obtained as a linear combination of
% r symmetric rank-1 tensors that are each m-by-m-by-...-by-m.
% GVL4: Section 12.5.7.

a = zeros(m^d,1);
for k=1:r
    % Generate the kth rank-1 symmetric tensor...
    x = randn(m,1);
    v = x;
    for j=2:d
        v = kron(x,v);
    end
    % Add it in...
    a = a + randn(1)*v;
end
% Make it a tensor...
A = reshape(a,m*ones(1,d));

