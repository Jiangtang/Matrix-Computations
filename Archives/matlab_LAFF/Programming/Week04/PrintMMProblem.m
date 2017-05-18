
function [ error ] = PrintMMProblem( A, B )

output_string = '';
col = 1;

[ m_A, n_A ] = size( A );
[ m_B, n_B ] = size( B );

for i=1:max( m_A, m_B )
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
    
    if m_B == 1 & i == 1
        outstring = [ outstring '< ' ];
    elseif i == 1
        outstring = [ outstring '/ '];
    elseif i==m_B
        outstring = [ outstring '\ '];
    elseif i<m_B
        outstring = [ outstring '| '];
    else
        outstring = [ outstring '  '];
    end
    
    for j=1:n_B
        if i<=m_B
            outstring = [ outstring sprintf( '%2d ', B( i,j ) ) ];
        else
            outstring = [ outstring '   ' ];
        end
    end
    
    if m_B == 1 & i == 1
        outstring = [ outstring '>' ];
    elseif i == 1
        outstring = [ outstring '\ ' ];
    elseif i==m_B
        outstring = [ outstring '/ '];
    elseif i<m_B
        outstring = [ outstring '| ' ];
    end

    disp( outstring )
end
disp( ' ' )
disp( '=' )
disp( ' ' )
end

