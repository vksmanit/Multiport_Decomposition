function b = solution_of_system_using_lu(A,b)   
% --------------------------------------------------------------------------------
% Syntax : 
% --------------------------------------------------------------------------------
    size_of_system = length(b);
    %[rows, cols] = size(A);
    [L,U] = lu_decom(A);

    %%%%% Forward Substition %%%%%%
    for i = 1:size_of_system
        if (i ~= 1) 
            for j = 1 : (i-1)
                b(i) = b(i) - L(i,j) * b(j);
            end
        end
       %if (i == 1) 
       %    b(i) = b(i);
       %end
    end

    %%%% Backward Substitution %%%%
    for i = size_of_system :-1 : 1
        if (i == size_of_system)
            b(i) = b(i)/ U(i,i);
        else
            for j = size_of_system : -1 :(i+1)
                b(i) = b(i) - U(i,j) * b(j);
            end
            b(i) = b(i) / U(i,i);
        end


    end

end
