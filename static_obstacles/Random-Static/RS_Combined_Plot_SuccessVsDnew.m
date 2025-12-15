
close all;

num = 6; % number of different values of m considered.

It = 50;
Avg_Step = zeros(num,It);
Dnew = zeros(num,It);

for m=1:num
    for i = 1:It
        a = RS_AvgStep_and_Dnew(m);
        Avg_Step(m,i) = a(1);
        Dnew(m,i) = a(2);
        m
        i
    end
end

%success = (1./Avg_Step); % success is inversely proportional to Avg_Step

Combined_Dnew = [Dnew(1,:),Dnew(2,:),Dnew(3,:),Dnew(4,:),Dnew(5,:),Dnew(6,:)];
%Combined_Success = [success(1,:),success(2,:),success(3,:),success(4,:),success(5,:), success(6,:)];

Combined_Avg_Step = [Avg_Step(1,:),Avg_Step(2,:),Avg_Step(3,:),Avg_Step(4,:),Avg_Step(5,:), Avg_Step(6,:)];

figure

subplot(2,1,1)

scatter(Dnew(1,:),Avg_Step(1,:),'g')
xlabel('D (Scatter Within)')
ylabel('Average steps')
title('a=50, b=50, initial=(1,1), final=(25,25), walk=300, cutoff=1e6')

hold on

scatter(Dnew(2,:),Avg_Step(2,:),'r')
xlabel('D (Scatter Within)')
ylabel('Average steps')

hold on

scatter(Dnew(3,:),Avg_Step(3,:),'b')
xlabel('D (Scatter Within)')
ylabel('Average steps')

hold on

scatter(Dnew(4,:),Avg_Step(4,:),'y')
xlabel('D (Scatter Within)')
ylabel('Average steps')

hold on

scatter(Dnew(5,:),Avg_Step(5,:),'c')
xlabel('D (Scatter Within)')
ylabel('Average steps')

hold on

scatter(Dnew(6,:),Avg_Step(6,:),'k')
xlabel('D (Scatter Within)')
ylabel('Average steps')

legend({'m = 1','m = 4','m = 9','m = 16','m = 25','m = 36'},'Location','northeast');

hold off

subplot(2,1,2)

scatter(Combined_Dnew,Combined_Avg_Step)
xlabel('D (Scatter Within), m = {1,4,9,16,25,36}')
ylabel('Average steps')
title('a=50, b=50, initial=(1,1), final=(25,25), walk=300, cutoff=1e6')
lsline

