  function [W,Y] = WY(Q_fact)
% function [W,Y] = WY(Q_fact)
% WY representation of a Householder product Q_{1}...Q_{r}.
% Q_fact is mxr with r<=m. Assume that [zeros(j-1,1);Q_fact(j+1:m,j)] is 
%    the Householder vector that defines Q_{j}, j=1:r
% W is mxr and Y is mxr such that I - WY' = Q{1}*...*Q{r}
% GVL4: Algorithm 5.1.2
  [m,r] = size(Q_fact);
  for j=1:r
      v = [zeros(j-1,1);1;Q_fact(j+1:m,j)];
      beta = 2/(v'*v);
      if j==1
         Y = v;
         W = beta*v;
      else
         z = beta*(v - W*(Y(j:m,:)'*v(j:m)));
         Y = [Y v];
         W = [W z]; 
      end
  end