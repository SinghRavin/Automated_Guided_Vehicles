
function AvgStep = DS_LShaped_AvgStep(a,b,W)

    % For a fixed initial and final points 
    xi=1; yi=1; xf=a-1; yf=b-1;
    
    % a = x-axis length, b = y-axis length

    % Assuming that the obstacles would exists only in the inner rectangle
    % area ((a-2)*(b-2)) leaving width of 2 units on all four sides of the 
    % workspace
    
    % The obstacles are placed in a way that the region is L-shaped
    % The variable W is the width of the passage
    
    %Obstacles_Postion = DS_ZigZag_Obstacle_Generator(a,b,w);
    %O_left_x = Obstacles_Postion(1,:);
    %O_right_x = Obstacles_Postion(2,:);
    %O_left_y = Obstacles_Postion(3,:);
    %O_right_y = Obstacles_Postion(4,:);
    
    %O_left_first_x = repelem(1,b);
    %O_left_second_x = 2:a;
    %O_left_first_y = 1:b;
    %O_left_second_y = repelem(b,a-1);
    %O_right_first_x = repelem(W+1,b-W);
    %O_right_second_x = W+2:a;
    %O_right_first_y = 1:b-W;
    %O_right_second_y = repelem(b-W,a-W-1);
    
    O_outer_x = [repelem(1,b),2:a];
    O_outer_y = [1:b,repelem(b,a-1)];
    O_inner_x = [repelem(W+1,b-W),W+2:a];
    O_inner_y = [1:b-W,repelem(b-W,a-W-1)];
    
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

            % Conditions when process hits the obstacles on the outer edge
            % of L-shaped obstacle region
            
            for i=1:(a+b-1)
                %for j=[-1,0,1]
                 %   for k=[-1,0,1]
                        if (xr<=O_outer_x(i)) && (yr>=O_outer_y(i))
                            xr=O_outer_x(i)+1;
                            yr=O_outer_y(i)-1;
                        end
                  %  end
               % end
            end 
            
            % Conditions when process hits the obstacles on the inner edge
            % of L-shaped obstacle region
            
            for i=1:(a+b-2*W-1)
                %for j=[-1,0,1]
                 %   for k=[-1,0,1]
                        if (xr>=O_inner_x(i)) && (yr<=O_inner_y(i))
                            xr=O_inner_x(i)-1;
                            yr=O_inner_y(i)+1;
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

    