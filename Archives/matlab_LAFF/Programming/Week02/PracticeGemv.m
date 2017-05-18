disp( 'To end practice, enter Control-C' )

for i=1:10
    size_A = randi( [1,3], 2,1 );

    A = randi( [-2,2], size_A(1), size_A(2) );
    x = randi( [-2,2], size_A(2), 1 );

    m_A = size( A, 1 );
    for i=1:5
        disp( 'evaluate' )
        PrintMVProblem( A, x );
        
        answ = A * x;
        correct = 1;
        for j=1:m_A
            y( j,1 ) = input('');
            if y( j, 1 ) ~= answ( j )
                correct = 0;
            end
        end
        
        if correct
            disp('Correct!')
            disp(' ')
            break
        else
            disp('try again!' )
            disp(' ')
        end

        if i == 5
            disp( 'the answer is' )
            PrintMVProblem( A, x );
            disp( A * x )
        end
    end
end


