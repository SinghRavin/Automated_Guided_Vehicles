
a = 24;
b = 24;
W = 5; % width of the obstacle region

contourf(DS_ZigZag_LongTermProbFunction(a,b,W));
colorbar;
title("a*b = 25*25 with ZigZag shaped obstacle region of width 5");
xlim([1 25])
ylim([1 25])
xlabel("Workspace boundary")
ylabel("Workspace boundary")