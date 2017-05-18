function [ error ] = PrintMVProblem( A, x )

output_string = '';
col = 1;

[ m_A, n_A ] = size( A );
[ m_x, n_x ] = size( x );

for i=1:max( m_A, m_x )
    if m_A == 1 & i== 1
        outstring = '< ';
    elseif i == 1
        outstring = '/ ';
    elseif i==m_A
        outstring = '\ ';
    elseif i<m_A
        outstring = '| ';
    else
        outstring = '  ';
    end
    
    for j=1:n_A
        if i<=m_A
            outstring = [ outstring sprintf( '%2d ', A( i,j ) ) ];
        else
            outstring = [ outstring '   ' ];
        end
    end

    if m_A == 1 & i == 1
        outstring = [ outstring '>  ' ];
    elseif i == 1
        outstring = [ outstring '\  '];
    elseif i==m_A
        outstring = [ outstring '/  '];
    elseif i<m_A
        outstring = [ outstring '|  '];
    else
        outstring = [ outstring '   '];
    end
    
    if m_x == 1 & i == 1
        outstring = [ outstring '< ' ];
    elseif i == 1
        outstring = [ outstring '/ '];
    elseif i==m_x
        outstring = [ outstring '\ '];
    elseif i<m_x
        outstring = [ outstring '| '];
    else
        outstring = [ outstring '  '];
    end
    
    if i <= m_x 
        outstring = [ outstring sprintf( '%d ', x( i ) ) ];
    end        
    
    if m_x == 1 & i == 1
        outstring = [ outstring '>' ];
    elseif i == 1
        outstring = [ outstring '\ ' ];
    elseif i==m_x
        outstring = [ outstring '/ '];
    elseif i<m_x
        outstring = [ outstring '| ' ];
    end

    disp( outstring )
end
disp( '=' )

end

