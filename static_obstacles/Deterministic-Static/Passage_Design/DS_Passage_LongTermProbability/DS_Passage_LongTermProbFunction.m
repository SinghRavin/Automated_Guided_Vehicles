
function probmat = DS_Passage_LongTermProbFunction(a,b,W)
    % a = x-axis length 
    % b = y-axis length First
    % W = width of the passage
    
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

    % Introducing Passage obstacle region, and updating D matrix accordingly

    O_left_x = 1:a-W;
    O_left_y = 1+W:b;
    O_right_x = 2+W:a;
    O_right_y = 1:b-1-W;
    O_x = [O_left_x, O_right_x];
    O_y = [O_left_y, O_right_y];

    for i = 1:(a+b-2*W-1)
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