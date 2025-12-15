function Means = RS_Obstacles_Mean(O_x,O_y)

    mu_x = sum(O_x)/length(O_x);
    mu_y = sum(O_y)/length(O_y);
    
    Means = [mu_x, mu_y];
    
end