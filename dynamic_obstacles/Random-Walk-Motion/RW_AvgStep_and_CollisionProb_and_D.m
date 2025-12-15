
function AvgStep_and_CollisionProb_and_D = RW_AvgStep_and_CollisionProb_and_D(m,xf,yf)

    % a = x-axis length, b = y-axis length
    a=100; b=100;

    % For a fixed initial and final points 
    xi=1; yi=1; %xf=a-1; yf=b-1;
    
    D = sqrt(2*(xf-xi)^2);
    
    % The obstacle(s) motion is determined by a Random Walk
    
    walk = 300;
    count_vector = zeros(1,walk);
    collision_prob_vector = zeros(1,walk);
    
    cutoff = 1e6;
    
    for w=1:walk
        collision_count=zeros(m,1);
        count = 0;
        xr=xi; yr=yi;
        obstacles_mat = randi([1 a],[m 2]); % Creating m obstacles performing independent random walks
        while ((xr~=xf) || (yr~=yf))

            count=count+1; 
            
            % Random walk motion of robot

            pr = -1;
            qr = 1;

            rx =(qr-pr)*rand(1)+pr;
            ry =(qr-pr)*rand(1)+pr;

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

            % Random walk motion of obstacles
            
            p = -1;
            q = 1;

            o =(q-p).*rand([m 2])+p;
            
            for i=1:m
                for j=1:2
                    if o(i,j)>=0
                        o(i,j)=1;
                    else
                        o(i,j)=-1;
                    end
                end
            end
            
            obstacles_mat = obstacles_mat + o;
            
            % Condition when obstacles hit the boundary

            for i=1:m
                if obstacles_mat(i,1)>=a
                    obstacles_mat(i,1)=a-1;
                end
                if obstacles_mat(i,1)<=1
                    obstacles_mat(i,1)=2;
                end
            end
            
            for i=1:m
                if obstacles_mat(i,2)>=b
                    obstacles_mat(i,2)=b-1;
                end
                if obstacles_mat(i,2)<=1
                    obstacles_mat(i,2)=2;
                end
            end
            
            % Conditions when the robot and obstacles collides (comes to the same
            % position)
            
             for i=1:m
                 if (xr==obstacles_mat(i,1)) && (yr==obstacles_mat(i,2))
                     collision_count(i) = collision_count(i)+1;
                     xr=xr+rx;
                     yr=yr+ry;
                 end
             end
            
            % Specifiying the cutoff to indicate that the robot got stuck
            % between obstacles.
            
            if (count == cutoff)
                break;
            end
        end
        
        count_vector(w) = count;
        collision_prob_vector(w) = sum(collision_count)/count;
        
    end
    AvgStep = mean(count_vector);
    CollisionProb = mean(collision_prob_vector);
    
    AvgStep_and_CollisionProb_and_D = [AvgStep, CollisionProb, D];
end

    