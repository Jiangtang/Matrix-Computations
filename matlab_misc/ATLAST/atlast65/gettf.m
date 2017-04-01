function s=gettf(i);
global tf
s=[];
 for j=1:7,  s=[s num2str(tf(i,j)) '	']; end; s=[s ';'];
   
