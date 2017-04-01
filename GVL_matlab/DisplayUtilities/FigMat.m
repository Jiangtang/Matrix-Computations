function FigMat()

close all
figure
axis ij equal off
hold on
A = ['xxxxx';...
     'XXxxx';...
     'ooxxx';...
     'oo+xx';...
     'oooox';...
     'xxx+x'];
ShowMatrixXO(A,0,10)

function ShowMatrixXO(A,x0,y0)
% A (mxn) character array
% 
[m,n] = size(A);
HA = 'HorizontalAlignment';
fill([x0 x0+n x0+n x0],[y0 y0 y0+m y0+m],'w','linewidth',2)
for i=1:m
    for j=1:n
        x = x0-.5 + j;
        y = y0-.5 + i;
        if A(i,j)=='x'
            text(x,y,'x',HA,'center','Fontweight','bold','Fontsize',14,'color','k')
        elseif A(i,j)=='X'
            text(x,y,'x',HA,'center','Fontweight','bold','Fontsize',14,'color','r')
        elseif A(i,j)=='o'
            text(x,y,'0',HA,'center','Fontweight','bold','Fontsize',14,'color','k')
        elseif A(i,j)=='+'
            text(x,y,'+',HA,'center','Fontweight','bold','Fontsize',16,'color','k')
        end
    end
end