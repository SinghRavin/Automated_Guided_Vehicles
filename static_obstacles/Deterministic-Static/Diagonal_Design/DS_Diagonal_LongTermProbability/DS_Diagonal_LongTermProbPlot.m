
a = 50;
b = 50;
m = 30; % must be less than or equal to a+1 or b+1. 

contourf(DS_Diagonal_LongTermProbFunction(a,b,m));
colorbar;
title("a*b = 20*20 with 10 Static obstacles placed along diagonal");
xlabel("Workspace boundary")
ylabel("Workspace boundary")