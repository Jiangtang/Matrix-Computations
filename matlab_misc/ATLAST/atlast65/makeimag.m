function A=makeimag(n,imag,back)
% The command A=makeimag(n,imag,back) lets 
% the user create an n-by-n image with imag 
% and back being the image and background 
% colors,respectively, based on the current 
% colormap. Click with the mouse to toggle 
% to toggle a square between background and 
% image color. Type q when done.
%
% Default image and background colors are 
% used if only one input argument is specified.
subplot(1,1,1)
if nargin==1, imag=27; back=1; end
if nargin==2, back=1; end
A=ones(n)*back;
image(A);axis('square')
while 1
   [x,y,z]=ginput(1);
   if abs(z)=='q'
      break
   elseif (x>=1) &(x<n+1) & (y>=1) &(y<n+1)
      x=fix(x); y=fix(y);
      if A(y,x)==back
         A(y,x)=imag;
      else
         A(y,x)=back;
      end
      image(A); axis('square')
   end
end
close
