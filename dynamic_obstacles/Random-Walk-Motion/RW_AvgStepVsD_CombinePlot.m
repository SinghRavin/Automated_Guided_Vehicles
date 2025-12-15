
close all;

num = 5;
final_position = 10:10:90;
Avg_Step = zeros(num,length(final_position));
D = zeros(num,length(final_position));

for i = 1:num
    for j=1:length(final_position)
        a = RW_AvgStep_and_CollisionProb_and_D(i,final_position(j),final_position(j));
        Avg_Step(i,j) = a(1);
        D(i,j) = a(3);
        i
        j
    end
end

figure

plot(D(1,:),Avg_Step(1,:),'r')
xlabel('Distance between initial and final points')
ylabel('Average steps')
title('Obstacle(s) performing independent Random Walks, a=100, b=100, initial=(1,1), walk=300, cutoff=1e6')

hold on

plot(D(2,:),Avg_Step(2,:),'g')
xlabel('Distance between initial and final points')
ylabel('Average steps')
title('Obstacle(s) performing independent Random Walks, a=100, b=100, initial=(1,1), walk=300, cutoff=1e6')

hold on

plot(D(3,:),Avg_Step(3,:),'b')
xlabel('Distance between initial and final points')
ylabel('Average steps')
title('Obstacle(s) performing independent Random Walks, a=100, b=100, initial=(1,1), walk=300, cutoff=1e6')

hold on

plot(D(4,:),Avg_Step(4,:),'c')
xlabel('Distance between initial and final points')
ylabel('Average steps')
title('Obstacle(s) performing independent Random Walks, a=100, b=100, initial=(1,1), walk=300, cutoff=1e6')

hold on

plot(D(5,:),Avg_Step(5,:),'k')
xlabel('Distance between initial and final points')
ylabel('Average steps')
title('Obstacle(s) performing independent Random Walks, a=100, b=100, initial=(1,1), walk=300, cutoff=1e6')

legend({'m = 1','m = 2','m = 3','m = 4','m = 5'},'Location','northeast');

hold off
