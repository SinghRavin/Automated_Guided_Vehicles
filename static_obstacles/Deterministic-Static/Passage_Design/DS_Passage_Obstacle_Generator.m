function Obstacles_Position = DS_Passage_Obstacle_Generator(a,b,w)

    O_left_x = 1:a-w;
    O_right_x = 2+w:a;
    O_left_y = 1+w:b;
    O_right_y = 1:b-1-w;
  
    Obstacles_Position = [O_left_x; O_right_x; O_left_y; O_right_y];
    Obstacles_Postion_left = [O_left_x;O_left_y];
    Obstacles_Postion_right = [O_right_x;O_right_y];
    
end