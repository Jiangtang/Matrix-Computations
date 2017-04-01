  function x = fl6(a)
% Representation of a real matrix in 6-digit floating point format.
% a is a real mxn array
% x is an mxn array whose entries are in 6-digit FP format. 
%
% If a is a scalar that satisfies 1.00000*10^-9<=|a|<=9.99999*10^9, then
%      x.sign:  0 or 1 
%      x.d0  :  1<=d1<=9 (integer)
%      x.d1  :  0<=d2<=9 (integer)
%      x.d2  :  0<=d3<=9 (integer)
%      x.d3  :  0<=d2<=9 (integer)
%      x.d4  :  0<=d3<=9 (integer)
%      x.d5  :  0<=d2<=9 (integer)
%      x.e   :  -9<=e<=9 (integer)
% defines the "6-digit FP representation" of a and its value is
%
%  (-1)^x.sign*(d0 + d1/10 + d2/100 + d3/1000 + d4/10000 + d5/100000)*10^e
%
% If a is a matrix, then x has the same size and x(i,j) = fl6(a(i,j)).

[m,n] = size(a);
if m==1&&n==1
   if abs(a)< 1.00000*10^-9
      % a is zero or underflows...
      x = struct('sign',0,'d0',0,'d1',0,'d2',0,'d3',0,'d4',0,'d5',0,'e',0);
   elseif abs(a)> 9.99999*10^9
      % Overflow...
      x = struct('sign',9,'d0',0,'d1',0,'d2',0,'d3',0,'d4',0,'d5',0,'e',0);
   else
      % Extract... 
      [d0,d1,d2,d3,d4,d5,e] = TakeApart(abs(a));
      if a>0
         x = struct('sign',0,'d0',d0,'d1',d1,'d2',d2,'d3',d3,'d4',d4,'d5',d5,'e',e);
      else
         x = struct('sign',1,'d0',d0,'d1',d1,'d2',d2,'d3',d3,'d4',d4,'d5',d5,'e',e);
      end
   end
else
    for i=1:m
        for j=1:n
            x(i,j) = fl6(a(i,j));
        end
    end
    [m1,n1] = size(x);
    if m1~=m || n1~=n
        x = x';
    end
end

  function [d0,d1,d2,d3,d4,d5,e] = TakeApart(a)
% a is a real that satisfies 1.00000*10^-9 <= a <= 9.99999*10^9.
% (d0 + d1/10 + d2/100 + d3/1000 + d4/10000 + d5/100000)*10^e is 
% the closest number to a subject to the constraint that 
%     e  (integer) satisfies -9<=e<=9
%    d0  (integer) satisfies 1<=d0<=9
%    d1  (integer) satisfies 0<=d1<=9
%    d2  (integer) sarisfies 0<=d2<=9
%    d3  (integer) satisfies 0<=d1<=9
%    d4  (integer) sarisfies 0<=d2<=9
%    d5  (integer) satisfies 0<=d1<=9

% a = m*10^e where 
e = floor(log10(a));
m = a/10^e;
% Get the 6 leading digits of m...
m1 = round(100000*m);
d0 = floor(m1/100000);
m1 = m1-d0*100000;
d1 = floor(m1/10000);
m1 = m1-d1*10000;
d2 = floor(m1/1000);
m1 = m1-d2*1000;
d3 = floor(m1/100);
m1 = m1-d3*100;
d4 = floor(m1/10);
d5 = m1-d4*10;


    