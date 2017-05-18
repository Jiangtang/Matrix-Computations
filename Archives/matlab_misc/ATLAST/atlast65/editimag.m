function A=editimag(B,imag,back)

% EDITIMAG   Edit an image created with MAKEIMAG.
%            The command (B,imag,back) edits the image
%            represented by the matrix B that was originally
%            created using the M-file makeimag. The input
%            arguments imag and back specify the image and
%            background colors based on the current colormap.
%            Click on a square to toggle between the background
%            color and the image color. Type q to quit.
%
%            Default colors are used if imag and back are not 
%            specified as input arguments.
%
%    Larry Riddle, ATLAST Workshop, San Diego, June 1994
%    Modified by S.J. Leon, May 1996

subplot(1,1,1)
[n,m]=size(B);
if nargin==1,imag=27;back=1;end
if nargin==2,back=1;end
A=B;
image(A); axis('square')
while 1
   [x y z]=ginput(1);
   if abs(z)=='q'
      break
   elseif (x>=1) & (x<n+1) & (y>=1) & (y<n+1)
      x=fix(x); y=fix(y);
      if A(y,x)~=imag
         A(y,x)=imag;
      else
         A(y,x)=back;
      end
      image(A); axis('square')
   end
end
close
