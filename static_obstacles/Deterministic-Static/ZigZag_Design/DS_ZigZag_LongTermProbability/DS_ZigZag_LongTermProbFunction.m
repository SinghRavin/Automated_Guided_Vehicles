
function probmat = DS_ZigZag_LongTermProbFunction(a,b,W)
    % a = x-axis length 
    % b = y-axis length First
    % W = width of the ZigZag Shaped obstacle region
    
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

    % Introducing ZigZag shaped obstacle region, and updating D matrix accordingly

    O_left_x = [repelem(1,W+1),2:W+1];
    O_left_y = [1:W+1,repelem(W+1,W)];
    O_right_x = 1:2*W+1;
    O_right_y = repelem(1,2*W+1);
    
    k=floor(2*a/W); % number of stair like steps
    
    for i=0:k
        O_left_x = [O_left_x,repelem(O_left_x(end),2*W),O_left_x(end)+1:O_left_x(end)+2*W];
        O_left_y = [O_left_y,O_left_y(end)+1:O_left_y(end)+2*W,repelem(O_left_y(end)+2*W,2*W)];
        O_right_x = [O_right_x,repelem(O_right_x(end),2*W),O_right_x(end)+1:O_right_x(end)+2*W];
        O_right_y = [O_right_y,O_right_y(end)+1:O_right_y(end)+2*W,repelem(O_right_y(end)+2*W,2*W)];
    end
    
    O_x = [O_left_x, O_right_x];
    O_y = [O_left_y, O_right_y];

    for i = 1:2*(1+2*W+4*W*k)
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

    %mat = ones(b+1,a+1)*(1/(sum(D,'all')));
    probmat = D*(1/(sum(D,'all')));

end