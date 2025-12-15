
function AvgStep = No_Obstacles_AvgStep(a,b,walk)

    % For a fixed initial and final points 
    xi=1; yi=1; xf=a-1; yf=b-1;
    
    % a = x-axis length, b = y-axis length
    
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

    