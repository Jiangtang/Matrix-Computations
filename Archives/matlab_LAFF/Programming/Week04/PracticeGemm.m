disp( 'Practice as many matrix-matrix multiplications as you want!' )
disp( 'We suggest you get a piece of paper out rather than trying to' )
disp( 'do it in your head.' )
disp( 'To end practice, enter Control-C' )


for i=1:50
    size_A = randi( [1,3], 2,1 );
    size_B = randi( [1,3], 2,1 );

    A = randi( [-2,2], size_A(1), size_A(2) );
    B = randi( [-2,2], size_A(2), size_B(2) );

    m_A = size( A, 1 );
    for i=1:3
        disp( 'evaluate' )
        PrintMMProblem( A, B );
        
        answ = A * B;
        
        C = input('');
        
        if isequal( C, answ )
            disp('Correct!')
            disp(' ')
            break
        else
            disp('try again!' )
            disp(' ')
        end

        if i == 3
            disp( 'the answer is' )
            PrintMMProblem( A, B );
            disp( A * B )
        end
    end
    disp( 'To end practice, enter Control-C' )
    disp( ' ' )
end


