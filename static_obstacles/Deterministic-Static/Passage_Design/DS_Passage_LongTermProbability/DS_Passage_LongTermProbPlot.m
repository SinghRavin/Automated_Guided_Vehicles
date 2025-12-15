
a = 19;
b = 19;
W = 5; % width of the obstacle region 

contourf(DS_Passage_LongTermProbFunction(a,b,W));
colorbar;
title("a*b = 20*20 with Passage obstacles region of width 5");
xlabel("Workspace boundary")
ylabel("Workspace boundary")