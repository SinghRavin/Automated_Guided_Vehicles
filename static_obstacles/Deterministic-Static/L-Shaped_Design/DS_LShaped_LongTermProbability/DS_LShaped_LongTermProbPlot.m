
a = 19;
b = 19;
W = 5; % width of the obstacle region 

contourf(DS_LShaped_LongTermProbFunction(a,b,W));
colorbar;
title("a*b = 20*20 with L-Shaped obstacles region of width 5");
xlabel("Workspace boundary")
ylabel("Workspace boundary")