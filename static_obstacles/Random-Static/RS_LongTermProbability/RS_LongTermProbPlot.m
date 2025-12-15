
a = 19;
b = 19;
m = 10; % must be less than or equal to a+1 or b+1. 

contourf(RS_LongTermProbFunction(a,b,m));
colorbar;
title("a*b = #*# with m Randomly placed Static obstacles");