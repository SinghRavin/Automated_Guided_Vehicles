
close all;

a=50; b=50; % Note: The dimensions of workspace are being called inside the function "RW_AvgStep_and_CollisionProb_and_D"
It = 50;
num = 5;
Avg_Step = zeros(num,It);
Collision_Prob = zeros(num,It);

for i = 1:num
    for j=1:It
        a = RW_AvgStep_and_CollisionProb(i,a-1,b-1);
        Avg_Step(i,j) = a(1);
        Collision_Prob(i,j) = a(2);
        i
        j
    end
end

Combined_Collision_Prob = [Collision_Prob(1,:),Collision_Prob(2,:),Collision_Prob(3,:),Collision_Prob(4,:),Collision_Prob(5,:)];
Combined_Avg_Step = [Avg_Step(1,:),Avg_Step(2,:),Avg_Step(3,:),Avg_Step(4,:),Avg_Step(5,:)];

figure

subplot(2,1,1)

scatter(Collision_Prob(1,:),Avg_Step(1,:),'r')
xlabel('Collision probability')
ylabel('Average steps')
title('Obstacle(s) performing independent Random Walks, a=50, b=50, initial=(1,1), final=(49,49), walk=300, cutoff=1e6')

hold on

scatter(Collision_Prob(2,:),Avg_Step(2,:),'b')
xlabel('Collision probability')
ylabel('Average steps')

hold on

scatter(Collision_Prob(3,:),Avg_Step(3,:),'g')
xlabel('Collision probability')
ylabel('Average steps')

hold on

scatter(Collision_Prob(4,:),Avg_Step(4,:),'c')
xlabel('Collision probability')
ylabel('Average steps')

hold on

scatter(Collision_Prob(5,:),Avg_Step(5,:),'k')
xlabel('Collision probability')
ylabel('Average steps')
title('m obstacle(s) performing independent Random Walks, a=50, b=50, initial=(1,1), final=(49,49), walk=300, cutoff=1e6')

legend({'m = 1','m = 2','m = 3','m = 4','m = 5'},'Location','northeast');

hold off

subplot(2,1,2)

scatter(Combined_Collision_Prob,Combined_Avg_Step)
xlabel('Collision probability')
ylabel('Average steps')
title('m obstacle(s) performing independent Random Walks, a=50, b=50, initial=(1,1), final=(49,49), walk=300, cutoff=1e6')
lsline



