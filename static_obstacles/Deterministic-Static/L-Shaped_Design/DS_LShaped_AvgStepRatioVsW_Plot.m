
close all;

W = 20; % different widths of obstacle region
workspace_dim = [50,75,100,125];
Avg_Step = zeros(length(workspace_dim),W);

for i = 1:length(workspace_dim)
    for j = 1:W
        Avg_Step(i,j) = DS_LShaped_AvgStep(workspace_dim(i),workspace_dim(i),j);
        j
    end
end

ratio = zeros(length(workspace_dim),W);

for i = 1:length(workspace_dim)
    for j = 1:W
        ratio(i,j) = Avg_Step(i,j)/((workspace_dim(i)^2)-(workspace_dim(i)-j)*(workspace_dim(i)-j));
    end
end

figure

subplot(2,1,1)

plot(1:W,Avg_Step(1,:),'g')
xlabel('Width of the passage')
ylabel('Average steps')
title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = L-Shaped passage of width W')

hold on

plot(1:W,Avg_Step(2,:),'r')
xlabel('Width of the passage')
ylabel('Average steps')
title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = L-Shaped passage of width W')

hold on

plot(1:W,Avg_Step(3,:),'b')
xlabel('Width of the passage')
ylabel('Average steps')
title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = L-Shaped passage of width W')

hold on

plot(1:W,Avg_Step(4,:),'c')
xlabel('Width of the passage')
ylabel('Average steps')
title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = L-Shaped passage of width W')

legend({'a*b = 50*50','a*b = 100*100','a*b = 150*150','a*b = 200*200'},'Location','northeast');

hold off

subplot(2,1,2)

plot(1:W,ratio(1,:),'g')
xlabel('Width of the passage')
ylabel('Average steps')
title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = L-Shaped passage of width W')

hold on

plot(1:W,ratio(2,:),'r')
xlabel('Width of the passage')
ylabel('Average steps/Enclosed area')
title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = L-Shaped passage of width W')

hold on

plot(1:W,ratio(3,:),'b')
xlabel('Width of the passage')
ylabel('Average steps/Enclosed area')
title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = L-Shaped passage of width W')

hold on

plot(1:W,ratio(4,:),'c')
xlabel('Width of the passage')
ylabel('Average steps/Enclosed area')
title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = L-Shaped passage of width W')

legend({'a*b = 50*50','a*b = 100*100','a*b = 150*150','a*b = 200*200'},'Location','northeast');

hold off

