
function AvgStep = DS_Passage_AvgStep(a,b,W,walk,m,region)

    % For a fixed initial and final points 
    xi=1; yi=1; xf=a-1; yf=b-1;
    
    % a = x-axis length, b = y-axis length
    
    % m,region determines the number of holes in the obstacle boundary
    % and their location respectively.

    % Assuming that the obstacles would exists only in the inner rectangle
    % area ((a-2)*(b-2)) leaving width of 2 units on all four sides of the 
    % workspace
    
    % The obstacles are placed in a way that the region is rectangular
    % passage
    % The variable W is the width of the passage
    
    %Obstacles_Postion = DS_ZigZag_Obstacle_Generator(a,b,w);
    %O_left_x = Obstacles_Postion(1,:);
    %O_right_x = Obstacles_Postion(2,:);
    %O_left_y = Obstacles_Postion(3,:);
    %O_right_y = Obstacles_Postion(4,:);
    
    O_left_x = 1:a-W;
    O_left_y = 1+W:b;
    O_right_x = 2+W:a;
    O_right_y = 1:b-1-W;
    
    if (region == 'LL')
        O_left_x = [O_left_x(m+1:end)];
        O_left_y = [O_left_y(m+1:end)];
    end
    if (region == 'LU')
        O_left_x = [O_left_x(1:end-m)];
        O_left_y = [O_left_y(1:end-m)];
    end
    if (region == 'RL')
        O_right_x = [O_right_x(m+1:end)];
        O_right_y = [O_right_y(m+1:end)];
    end
    if (region == 'RU')
        O_right_x = [O_right_x(1:end-m)];
        O_right_y = [O_right_y(1:end-m)];
    end
    
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

            % Conditions when process hits the obstacles on the left edge
            % of an obstacle region
            
            for i=1:length(O_left_x)
                %for j=[-1,0,1]
                 %   for k=[-1,0,1]
                        if (xr<=O_left_x(i)) && (yr>=O_left_y(i))
                            xr=O_left_x(i)+1;
                            yr=O_left_y(i)-1;
                        end
                  %  end
               % end
            end 
            
            % Conditions when process hits the obstacles on the right edge
            % of an obstacle region
            
            for i=1:length(O_right_x)
                %for j=[-1,0,1]
                 %   for k=[-1,0,1]
                        if (xr>=O_right_x(i)) && (yr<=O_right_y(i))
                            xr=O_right_x(i)-1;
                            yr=O_right_y(i)+1;
                        end
                  %  end
               % end
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
 
end

    