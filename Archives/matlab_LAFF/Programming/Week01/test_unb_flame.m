%% Dot_unb
x = [
     1
     2
     3
     ];

y =[

     1
    -1
     2];
 
alpha = Dot_unb(alpha, x, y)     

alpha2 = x' * y

%% Axpy_unb
alpha = 2;
y_out = Axpy_unb( alpha, x, y )
y_out2 = alpha * x + y