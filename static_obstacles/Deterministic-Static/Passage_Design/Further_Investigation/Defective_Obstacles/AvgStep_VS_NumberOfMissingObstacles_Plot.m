
close all;

walks = 9600;
width = 20; % width of the obstacle region
workspace_dim = 50; % workspace dimension i.e., a = b = 50
m = [1:30]; % m is the number of missing obstacles (consecutive)
region = ["LL","LU"]; % region of the missing obstacles
Avg_Step = zeros(length(m),length(region));

for i = 1:length(region)
    for j = 1:length(m)
        Avg_Step(i,j) = DS_Passage_AvgStep(workspace_dim,workspace_dim,width,walks,m(j),region(i));
        j
    end
end

figure

plot(m,Avg_Step(1,:),'g')

hold on

plot(m,Avg_Step(2,:),'r')

xlabel('Number of consecutive missing obstacles')
ylabel('Average steps')

legend({'Lower Side','Upper Side'},'Location','northeast');

hold off