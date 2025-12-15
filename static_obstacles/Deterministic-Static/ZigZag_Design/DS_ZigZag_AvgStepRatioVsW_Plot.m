close all;

W = 30; % different widths of obstacle region
workspace_dim = [50,75,100,125];
Avg_Step = zeros(length(workspace_dim),W);

for i = 1:length(workspace_dim)
    for j = 10:W
        Avg_Step(i,j) = DS_ZigZag_AvgStep(workspace_dim(i),workspace_dim(i),j);
        j
    end
end

ratio = zeros(length(workspace_dim),W);

for i = 1:length(workspace_dim)
    for j = 10:W
        ratio(i,j) = Avg_Step(i,j)/(2*workspace_dim(i)*j);
    end
end

figure

subplot(1,2,1)

plot(10:W,Avg_Step(1,10:30),'g')
xlabel('Width of the passage')
ylabel('Average steps')
%title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = ZigZag passage of width W')

hold on

plot(10:W,Avg_Step(2,10:30),'r')
xlabel('Width of the passage')
ylabel('Average steps')
%title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = ZigZag passage of width W')

hold on

plot(10:W,Avg_Step(3,10:30),'b')
xlabel('Width of the passage')
ylabel('Average steps')
%title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = ZigZag passage of width W')

hold on

plot(10:W,Avg_Step(4,10:30),'c')
xlabel('Width of the passage')
ylabel('Average steps')
%title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = ZigZag passage of width W')

legend({'a*b = 50*50','a*b = 75*75','a*b = 100*100','a*b = 125*125'},'Location','northeast');
title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6')

hold off

subplot(1,2,2)

plot(10:W,ratio(1,10:30),'g')
xlabel('Width of the passage')
ylabel('Average steps')
%title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = ZigZag passage of width W')

hold on

plot(10:W,ratio(2,10:30),'r')
xlabel('Width of the passage')
ylabel('Average steps/Enclosed area')
%title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = ZigZag passage of width W')

hold on

plot(10:W,ratio(3,10:30),'b')
xlabel('Width of the passage')
ylabel('Average steps/Enclosed area')
%title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = ZigZag passage of width W')

hold on

plot(10:W,ratio(4,10:30),'c')
xlabel('Width of the passage')
ylabel('Average steps/Enclosed area')
%title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6, Obstacles region = ZigZag passage of width W')

legend({'a*b = 50*50','a*b = 75*75','a*b = 100*100','a*b = 125*125'},'Location','northeast');
title('Obstacles region = ZigZag passage of width W')

hold off