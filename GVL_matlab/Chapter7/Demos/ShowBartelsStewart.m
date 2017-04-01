  function ShowBartelsStewart()
% function ShowBartelsStewart()
% Illustrates the Bartels-Stewart Algorithm
% GVL4: Algorithm 7.6.2
clc
fprintf('The Bartels-Stewart Algorithm \n\n')
p = 5; 
r = 3; 
F = triu(rand(p,p));
fprintf('F =\n')
fprintfM('%7.3f',F)
G = triu(randn(r,r));
fprintf('G =\n')
fprintfM('%7.3f',G)
C = randn(p,r);
fprintf('C =\n')
fprintfM('%7.3f',C)
Z = BartelsStewart(F,G,C);
fprintf('Z =\n')
fprintfM('%20.6f',Z)
fprintf('\n||FZ-ZG-C|| = %10.3e\n',norm(F*Z-Z*G-C))