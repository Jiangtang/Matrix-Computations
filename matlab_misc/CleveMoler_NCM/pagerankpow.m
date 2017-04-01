function [x,cnt] = pagerankpow(G)
% PAGERANKPOW  PageRank by power method with no matrix operations.
% x = pagerankpow(G) is the PageRank of the graph G.
% [x,cnt] = pagerankpow(G) also counts the number of iterations.
% There are no matrix operations.  Only the link structure
% of G is used with the power method.

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

% Link structure

[n,n] = size(G);
for j = 1:n
   L{j} = find(G(:,j));
   c(j) = length(L{j});
end

% Power method

p = .85;
delta = (1-p)/n;
x = ones(n,1)/n;
z = zeros(n,1);
cnt = 0;
while max(abs(x-z)) > .0001
   z = x;
   x = zeros(n,1);
   for j = 1:n
      if c(j) == 0
         x = x + z(j)/n;
      else
         x(L{j}) = x(L{j}) + z(j)/c(j);
      end
   end
   x = p*x + delta;
   cnt = cnt+1;
end
