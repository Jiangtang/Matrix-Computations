%% ZeroMatrix_unbF,
A = [1 2 3; 3 4 5]
ZeroMatrix_unb( A )

B = randi(3,5)
ZeroMatrix_unb( B )

%% Set_to_identity_unb
C = randi(3,3)
Set_to_identity_unb( C )

%% Set_to_identity_unb2
D = randi(4,4)
Set_to_identity_unb2( D )

%% Set_to_identity_unb3
E = randi(4,4)
Set_to_identity_unb3( E )

%%Set_to_diagonal_matrix_unb
F=randi(4,4)
x =  [1 2 3 4]'
Set_to_diagonal_matrix_unb(F,x)

%% Set_to_lower_triangular_unb( A )
Set_to_lower_triangular_unb( A )
Set_to_lower_triangular_unb2( A )


%% transpose
g = randi([1,2],3,4)
gg = randi([1,2],4,3)