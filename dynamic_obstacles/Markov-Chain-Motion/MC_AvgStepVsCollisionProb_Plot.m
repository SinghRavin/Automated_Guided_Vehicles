
close all;

It = 150;
Avg_Step = zeros(1,It);
Collision_Prob = zeros(1,It);

for i = 1:It
    a = MC_AvgStep_and_CollisionProb();
    Avg_Step(1,i) = a(1);
    Collision_Prob(1,i) = a(2);
    i
end

figure

scatter(Collision_Prob(1,:),Avg_Step(1,:),'r')
xlabel('Collision probability')
ylabel('Average steps')
title('5-states Markov Chain, a=50, b=50, initial=(1,1), final=(49,49), walk=300, cutoff=1e6')
lsline

