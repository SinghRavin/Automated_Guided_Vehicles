close all;

num = 20;
Avg_Step = zeros(1,num);

for i = 1:num
    a = DS_AvgStep_and_D(i);
    Avg_Step(i) = a(1);
    i
end

figure
plot(1:num,Avg_Step)
xlabel('number of static obstacles')
ylabel('success(average steps)')
title('a=50, b=50, initial=(1,1), final(24,24), walk=100, cutoff=10e5, obstacles placed diagonally')
