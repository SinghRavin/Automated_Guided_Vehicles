
function probmat = DS_LShaped_LongTermProbFunction(a,b,W)
    % a = x-axis length 
    % b = y-axis length First
    % W = width of the L-Shaped obstacle region
    
    D = zeros(b + 1, a + 1); % Degree of freedom matrix

    % Creating D matrix with no obstacle currently.

    for i = 1:b+1
        for j = 1:a+1
            if ((i==1) || (i==b+1)) && ((j==1) || (j==a+1))
                D(i,j) = 2;
            end
            if ((i~=1) && (i~=b+1)) && ((j~=1) && (j~=a+1))
                D(i,j) = 4;
            end
            if ((i~=1) && (i~=b+1)) && ((j==1) || (j==a+1))
                D(i,j) = 3;
            end
            if ((i==1) || (i==b+1)) && ((j~=1) && (j~=a+1))
                D(i,j) = 3;
            end
        end
    end 

    % Introducing L-Shaped obstacle region, and updating D matrix accordingly
    
    O_outer_x = [repelem(1,b),2:a];
    O_outer_y = [1:b,repelem(b,a-1)];
    O_inner_x = [repelem(W+1,b-W),W+2:a];
    O_inner_y = [1:b-W,repelem(b-W,a-W-1)];
    O_x = [O_outer_x, O_inner_x];
    O_y = [O_outer_y, O_inner_y];

    for i = 1:2*(a+b-W-1)
        try
        D(O_x(i)+1,O_y(i)) = D(O_x(i)+1,O_y(i)) - 1;
        catch
        end
        try
        D(O_x(i)-1,O_y(i)) = D(O_x(i)-1,O_y(i)) - 1;
        catch
        end
        try
        D(O_x(i),O_y(i)+1) = D(O_x(i),O_y(i)+1) - 1;
        catch
        end
        try
        D(O_x(i),O_y(i)-1) = D(O_x(i),O_y(i)-1) - 1;
        catch
        end
        D(O_x(i),O_y(i)) = 0;
    end

    % Finding the long-term probabilities

    mat = ones(b+1,a+1)*(1/(sum(D,'all')));
    probmat = (D.*mat)';

end