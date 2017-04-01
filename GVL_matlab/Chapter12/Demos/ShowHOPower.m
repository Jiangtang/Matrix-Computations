  function ShowHOPower()
% function ShowHOPower()
% Illustrates the Higher-Order Power Method
% GVL4: Section 12.5.6

% Set up an example..
n = [ 4 5 6 7 ];
A = randn(n);
itMax = 20;
% Three instances with random starting vectors...
u1 = Make_random_u(n);
[u1,sigVals1] = HOPower(A,u1,itMax);
u2 = Make_random_u(n);
[u2,sigVals2] = HOPower(A,u2,itMax);
u3 = Make_random_u(n);
[u3,sigVals3] = HOPower(A,u3,itMax);
% Display the progression of Psi(A,u) in each case...
clc
fprintf('The Higher-Order Power Method\n\n')
fprintf('size(A) = [')
fprintf('%2d',n);
fprintf(' ]\n\n')
fprintf('The value of Psi(A,u) for three different starting vector choices.\n\n')
fprintf('       Eg1         Eg2         Eg3\n')
fprintf('---------------------------------------')
fprintfM('%12.6f',[sigVals1 sigVals2 sigVals3])
   
  function sig = Psi(A,u)
% function sig = Psi(A,u)
% A is an n(1)-by- ... -by-n(d) tensor.
% u is a length-d cell array of column vectors where u{k} is n(k)-by-1.
% sig is the sum over all i (1<=i<=n) of A(i)*u{1}(i(1))*...*u{d}(i(d)).
sig = Vec(A)'*kronvec(u);
    
  function u = Make_random_u(n)
% function u = Make_random_u(n)
% n is a length-d vector of positive integers.
% u is a length-d cell array of unit 2-norm vectors where u{k} is
% n(k)-by-1.
d = length(n);
u = cell(d,1);
for k=1:d
   u{k} = randn(n(k),1);
   u{k} = u{k}/norm(u{k});
end
            
  function [u1,sigVals] = HOPower(A,u,itMax)
% function u1 = HOPower(A,u,itMax)
% A is an n(1)-by- ... -by-n(d) tensor.
% u is a length-d cell array of column vectors where u{k} is n(k)-by-1.
% itMax is a positive integer.
% Performs iTmax steps of the higher-order power method.
% u1 is the resulting update of u.
% sigVals is a column-vector that reports the value of Psi(A,u) at each
% step.
n = size(A);
d = length(n);
sigVals = Psi(A,u);
for j=1:itMax
   for k=1:d
      uk = TenToMat(A,k,[1:k-1 k+1:d])*kronvec(u([1:k-1 k+1:d]));
      u{k} = uk/norm(uk);
   end
   sigVals = [sigVals;Psi(A,u)];
end
u1 = u;

  function uvec = kronvec(u)
% function uvec = kronvec(u)
% u is a length-d cell array of column vectors where u{k} is n(k)-by-1.
% uvec = u{d} x ... x u{2} x u{1}.
d = length(u);
uvec = u{1};
for k=2:d
    uvec = kron(u{k},uvec);
end
                
                