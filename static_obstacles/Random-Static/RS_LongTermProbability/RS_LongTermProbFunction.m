
function probmat = RS_LongTermProbFunction(a,b,m)
    % a = x-axis length 
    % b = y-axis length First
    % m = number of static obstacles
    
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

    % Introducing obstacles (randomly), and updating D matrix accordingly

    O_x = randperm(a+1,m);
    O_y = randperm(b+1,m);

    for i = 1:m
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
    probmat = D.*mat;

end