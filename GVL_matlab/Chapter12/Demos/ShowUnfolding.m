  function ShowUnfolding()
% function ShowUnfolding()
% Displays various unfoldings of small tensors

% Some modal unfoldings...
A = zeros(4,3,2);
for i1=1:4
   for i2=1:3
      for i3=1:2
         A(i1,i2,i3) = i3+10*i2+100*i1;
      end
   end
end
clc
fprintf('Unfoldings\n\n')
fprintf('Modal Unfoldings of a 4x3x2 tensor.\n')
fprintf('Set A(i1,i2,i3) = i1i2i3, e.g., A(3,1,2) = 312\n\n')
fprintf('Mode-1 Unfolding:\n')
A1 = TenToMat(A,[1],[2 3]);
fprintfM('%6d',A1)
fprintf('Mode-2 Unfolding:\n')
A2 = TenToMat(A,[2],[1 3]);
fprintfM('%6d',A2)
fprintf('Mode-3 Unfolding:\n')
A3 = TenToMat(A,[3],[1 2]);
fprintfM('%6d',A3)

fprintf('\n\nGeneral Unfoldings of a 2x3x2x2x3 tensor\n')
fprintf('Set A(i1,i2,i3,i4,i5) = i1i2i3i4i5, e.g., A(3,1,2,7,8) = 31278\n\n')
n = [2 3 2 2 3];
A = zeros(n);
r = [1 2 3];
c = [4 5];
for i1=1:2
   for i2=1:3
      for i3=1:2
         for i4=1:2
            for i5=1:3
                A(i1,i2,i3,i4,i5) = i5+10*i4+100*i3+1000*i2+10000*i1;
            end
          end
      end
   end
end
fprintf('\n n =')
fprintf('%3d',n)
fprintf('\n r =')
fprintf('%3d',r)
fprintf('\n c =')
fprintf('%3d',c)
fprintf('\n')
fprintf('\nA_rxc =\n')
A_rxc = TenToMat(A,r,c);
fprintfM('%8d',A_rxc)


