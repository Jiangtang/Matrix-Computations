  function ShowBlockDiag()
% function ShowBlockDiag()
% Block Diagonalization of a block upper triangular matrix whose
% diagonal blocks have no eigenvalues in common.
% GVL4: Algorithm 7.6.1
clc
fprintf('Block Diagonalization\n\n')
q = 3;
n = [4 2 3];
% Build a qxq block matrix with blocking defined by n...
T = cell(q,q); Q = cell(q,q);
N = sum(n); 
matT = triu(randn(N,N));matT0 = matT; matQ = eye(N,N);
fprintf('T0 = \n')
fprintfM('%7.3f',matT)
fprintf('The block sizes = [')
fprintf(' %1d',n)
fprintf(']\n\n')
for i=1:q
    rows=sum(n(1:i-1))+1:sum(n(1:i));
    for j=1:q
        cols=sum(n(1:j-1))+1:sum(n(1:j));
        T{i,j} = matT(rows,cols);
        Q{i,j} = matQ(rows,cols);
    end
end
% Block diagonalization...
for j=2:q
   for i=1:j-1
      % Zero T{i,j}...
      Z = BartelsStewart(T{i,i},T{j,j},-T{i,j});
      for k=j:q
         T{i,k} = T{i,k} - Z*T{j,k};
      end
      for k=i:q
         T{k,j} = T{k,j} + T{k,i}*Z;  
      end
      for k=1:q
         Q{k,j} = Q{k,j} + Q{k,i}*Z; 
      end 
   end
end
% Display and check...
matT = zeros(N,N); matQ = zeros(N,N);
for i=1:q
    rows=sum(n(1:i-1))+1:sum(n(1:i));
    for j=1:q
        cols=sum(n(1:j-1))+1:sum(n(1:j));
        matT(rows,cols) = T{i,j};
        matQ(rows,cols) = Q{i,j};
    end
end
fprintf('inv(Q)*T0*Q =\n')
fprintfM('%7.3f',matT)
fprintf('||inv(Q)*T0*Q - T|| = %10.3e\n',norm(matQ\(matT0*matQ) - matT))