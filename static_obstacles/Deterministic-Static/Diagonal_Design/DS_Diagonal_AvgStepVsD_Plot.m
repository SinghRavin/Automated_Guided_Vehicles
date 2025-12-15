
close all;

num = 22; % maximum number of obstacles in workspace
Avg_Step = zeros(1,num);
D = zeros(1,num);

for i = 1:num
    a = DS_Diagonal_AvgStep_and_D(i);
    Avg_Step(i) = a(1);
    D(i) = a(2);
    i
end

figure
plot(D,Avg_Step)
xlabel('D')
ylabel('success(average steps)')
title('a=50, b=50, initial=(1,1), final=(25,25), walk=300, cutoff=1e6, obstacles placed diagonally')
