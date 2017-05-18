  function Q = BackAccum(Q_fact,type)
% function Q = BackAccum(Q_fact,type)
% Explicit formation of an orthogonal matrix from its factored form
%   representation. Uses backward accumulation.
% Q_fact is mxn and Q_fact(j+1:m,j) is the essential part of the 
% jth Householder matrix Q_{j}.
% A call of the form BackAccum(Q_fact,'thin') produces a "thin", mxn Q
% with orthonormal columns, the first n columns of Q_{1}...Q_{n}.
% A call of the form BackAccum(Q_fact) produces an mxm Q
% that is the product of of Q_{1}...Q_{n}.
% GVL4: Section 5.2.2
[m,n] = size(Q_fact);
if nargin==2 && m>n && strcmp(type,'thin')
   Q = [];
   for j=n:-1:1
      v = [1;Q_fact(j+1:m,j)];
      beta = 2/(v'*v);
      k = m-j;
      Q = [1 zeros(1,n-j);zeros(m-j,1) Q];
      if norm(Q_fact(j+1:m,j))>0
         Q = Q - (beta*v)*(v'*Q);
      end
   end
else
   Q = eye(max(m-n,1),max(m-n,1));
   for j=min(n,m-1):-1:1
      v = [1;Q_fact(j+1:m,j)];
      beta = 2/(v'*v);
      k = m-j;
      Q = [1 zeros(1,k);zeros(k,1) Q];
      if norm(Q_fact(j+1:m,j))>0
         Q = Q - (beta*v)*(v'*Q);
      end
   end
end
