
close all;

num = 6; % number of different values of m considered.

It = 50;
Avg_Step = zeros(num,It);
D = zeros(num,It);

for m=1:num
    for i = 1:It
        a = RS_AvgStep_and_D(m);
        Avg_Step(m,i) = a(1);
        D(m,i) = a(2);
        m
        i
    end
end

%success = (1./Avg_Step); % success is inversely proportional to Avg_Step

Combined_D = [D(1,:),D(2,:),D(3,:),D(4,:),D(5,:),D(6,:)];
Combined_Avg_Step = [Avg_Step(1,:),Avg_Step(2,:),Avg_Step(3,:),Avg_Step(4,:),Avg_Step(5,:),Avg_Step(6,:)];

figure

subplot(2,1,1)

scatter(D(1,:),Avg_Step(1,:),'g')
xlabel('D')
ylabel('Average steps')
title('a=50, b=50, initial=(1,1), final=(25,25), walk=300, cutoff=1e6')

hold on

scatter(D(2,:),Avg_Step(2,:),'r')
xlabel('D')
ylabel('Average steps')

hold on

scatter(D(3,:),Avg_Step(3,:),'b')
xlabel('D')
ylabel('Average steps')

hold on

scatter(D(4,:),Avg_Step(4,:),'y')
xlabel('D')
ylabel('Average steps')

hold on

scatter(D(5,:),Avg_Step(5,:),'c')
xlabel('D')
ylabel('Average steps)')

hold on

scatter(D(6,:),Avg_Step(6,:),'k')
xlabel('D')
ylabel('Average steps')

legend({'m = 1','m = 4','m = 9','m = 16','m = 25','m = 36'},'Location','northeast');

hold off

subplot(2,1,2)

scatter(Combined_D,Combined_Avg_Step)
xlabel('D, m = {1,4,9,16,25,36}')
ylabel('Average steps')
title('a=50, b=50, initial=(1,1), final=(25,25), walk=300, cutoff=1e6')
lsline
