
function AvgStep_and_D = RS_AvgStep_and_D(m)

    % For a fixed initial and final points 
    xi=1; yi=1; xf=25; yf=25;
    
    % a = x-axis length, b = y-axis length, m*m = number of static obstacles
    a=50; b=50;

    % Assuming that the obstacles would exists only in the inner rectangle
    % area ((a-2)*(b-2)) leaving width of 2 units on all four sides of the 
    % workspace.
    
    Obstacles_Position = RS_Obstacles_Generator(a,b,m,xf,yf);
    O_x = Obstacles_Position(1,:);
    O_y = Obstacles_Position(2,:);
    
    obstacle.position = [];
    mat = repmat(obstacle,m,m); % matrix mat contains all the distinct 
                                % positions of obstacles
    for i=1:m
       for j=1:m
           mat(i,j).position = [O_x(i),O_y(j)];
       end
    end
    
    % Calculating D
    
    D = 0;
    for i=1:m
        for j=1:m
            D = D + sqrt(sum((mat(i,j).position - [xi,yi]) .^ 2)) + sqrt(sum((mat(i,j).position - [xf,yf]) .^ 2));
        end
    end
    
    walk = 300;
    count_vector = zeros(1,walk);
    
    cutoff = 1e6;
    
    for w=1:walk
        count = 0;
        xr=xi; yr=yi;
        while ((xr~=xf) || (yr~=yf))

            count=count+1; 

            p = -1;
            q = 1;

            rx =(q-p)*rand(1)+p;
            ry =(q-p)*rand(1)+p;

            if rx>=0
                rx=1;
            else
                rx=-1;
            end

            if ry>=0
                ry=1;
            else
                ry=-1;
            end

            xr=xr+rx;
            yr=yr+ry;

            % Conditions when robot hits the boundary

            if xr>=a
              xr=a-1;
            end

            if xr<=1
               xr=2;    
            end

            if yr>=b
               yr=b-1;
            end

            if yr<=1
               yr=2;
            end

            % Conditions when process hits the obstacles

            for i=1:m
                for f=1:m
                % Considering the square dimension of 2*2 for static obstacle
                    %for j=[-1,0,1]
                        %for k=[-1,0,1]
                            if (xr==mat(i,f).position(1)) && (yr==mat(i,f).position(2))
                                xr=xr+1; % or, xr=xr +/- 1
                                yr=yr+1; % or, yr=yr +/- 1
                            end
                        %end
                    %end
                end
            end
            
            % Specifiying the cutoff to indicate that the robot got stuck
            % between obstacles.
            
            if (count == cutoff)
                break;
            end
        end
        count_vector(w) = count;
    end
    AvgStep = mean(count_vector);
    
    AvgStep_and_D = [AvgStep, D];
end

    