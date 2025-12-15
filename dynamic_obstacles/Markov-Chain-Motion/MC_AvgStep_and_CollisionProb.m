
function AvgStep_and_CollisionProb = MC_AvgStep_and_CollisionProb()

    % a = x-axis length, b = y-axis length
    a=50; b=50;

    % For a fixed initial and final points 
    xi=1; yi=1; xf=a-1; yf=b-1;
    
    % The obstacle's motion is determined by 5-states Markov Chain.
    
    O_x = [8,9,10,11,12];
    O_y = [12,11,10,9,8];
    
    % Initializing obstacle's position
    xo = 8; yo = 12;
    
    % Creating a transition matrix P
    P = [0.2,0.2,0.2,0.2,0.2;0.2,0.2,0.2,0.2,0.2;0.2,0.2,0.2,0.2,0.2;0.2,0.2,0.2,0.2,0.2;0.2,0.2,0.2,0.2,0.2];
    
    walk = 300;
    count_vector = zeros(1,walk);
    collision_prob_vector = zeros(1,walk);
    
    
    cutoff = 1e6;
    
    for w=1:walk
        collision_count=0;
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

            % Markov Chain motion of an obstacle
            
            for i=1:length(O_x)
                if (xo==O_x(i)) && (yo==O_y(i))
                    p = rand(1);
                    if p<=P(i,1)
                        xo=O_x(1); yo=O_y(1);
                    elseif (p>P(i,1)) && (p<=(P(i,1)+P(i,2)))
                        xo=O_x(2); yo=O_y(2);
                    elseif (p>(P(i,1)+P(i,2))) && (p<=(P(i,1)+P(i,2)+P(i,3)))
                        xo=O_x(3); yo=O_y(3);
                    elseif (p>(P(i,1)+P(i,2)+P(i,3))) && (p<=(P(i,1)+P(i,2)+P(i,3)+P(i,4)))
                        xo=O_x(4); yo=O_y(4);
                    else
                        xo=O_x(5); yo=O_y(5);
                    end
                end
             end
            
            % Conditions when the robot and obstacles comes to the same
            % position.
            
        
             if (xr==xo) && (yr==yo)
                 collision_count = collision_count+1;
                 xr=xr+rx;
                 yr=yr+ry;
             end
            
            % Specifiying the cutoff to indicate that the robot got stuck
            % between obstacles.
            
            if (count == cutoff)
                break;
            end
        end
        count_vector(w) = count;
        collision_prob_vector(w) = collision_count/count;
    end
    AvgStep = mean(count_vector);
    CollisionProb = mean(collision_prob_vector);
    
    AvgStep_and_CollisionProb = [AvgStep, CollisionProb];
end

    