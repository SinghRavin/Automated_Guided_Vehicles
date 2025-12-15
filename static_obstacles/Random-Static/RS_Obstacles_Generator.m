function Obstacles_Position = RS_Obstacles_Generator(a,b,m,xf,yf)

    O_x = randperm(a-4,m) + 2;
    O_y = randperm(b-4,m) + 2;
  
    % Conditioning that any obstacle should NOT be at final position (xf, yf).
    
    while (ismember(xf,O_x)==1)
        O_x = randperm(a-4,m) + 2;
    end
    
    while (ismember(yf,O_y)==1)
        O_y = randperm(a-4,m) + 2;
    end
    
    Obstacles_Position = [O_x; O_y];
    
end