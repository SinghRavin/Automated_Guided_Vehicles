
function AvgStep = DS_ZigZag_AvgStep(a,b,W)

    % For a fixed initial and final points 
    xi=1; yi=1; xf=a-2; yf=b-2;
    
    % a = x-axis length, b = y-axis length
    
    % The obstacles are placed in a way that the obstacle region is 
    % ZigZag shaped. The variable W is the width of the region
    
    % Creating ZigZag shaped obstacle region
    
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
    
    % Adjusting the final postion slightly in case the obstacle boundary
    % crossed through the final position.
    
    for i=1:(1+2*W+4*W*k)
        if(O_left_x(i)==xf && O_left_y(i)==yf)
            xf=xf+1; yf=yf-1;
        end
        if(O_right_x(i)==xf && O_right_y(i)==yf)
            xf=xf-1; yf=yf+1;
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

            % Conditions when process hits the obstacles on the left edge
            % of ZigZag shaped obstacle region
            
            for i=1:(1+2*W+4*W*k)
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
            % of ZigZag shaped obstacle region
            
            for i=1:(1+2*W+4*W*k)
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

    