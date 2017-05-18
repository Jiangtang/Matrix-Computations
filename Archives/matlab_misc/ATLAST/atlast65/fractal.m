% FRACTAL is an ATLAST utility that uses affine transformations
% to generate fractal images. This utility was developed by
% Victor Piotrowski, Daniel Okunbor, Henry Ricardo, Herb Lyon, 
% and Shangyou Zhang as part of an ATLAST workshop (Madison, 1997).
%    -- szhang@math.udel.edu
 
global sli_1 sli_1cur sli_2 sli_2cur fig cb_box popcol tf  cpop;
global  edp x pct figa

tf = [0.86 0.03  -0.03 0.86  0   1.5 0.83
      0.2 -0.25   0.21 0.23  0   1.5 0.08
     -0.15 0.27   0.25 0.26  0   .45 0.08
      0   0       0  0.17    0     0 0.01
      0    0      0    0    0     0   0];
x=[0 0]';   
   grfhd
