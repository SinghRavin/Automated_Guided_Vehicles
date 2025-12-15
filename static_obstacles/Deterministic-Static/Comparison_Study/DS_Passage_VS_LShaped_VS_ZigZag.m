
close all;

W = 20; % different widths of obstacle region
workspace_dim = [50];
Avg_Step_Passage = zeros(length(workspace_dim),W);
Avg_Step_LShaped = zeros(length(workspace_dim),W);
Avg_Step_ZigZag = zeros(length(workspace_dim),W);


for i = 1:length(workspace_dim)
    for j = 1:W
        Avg_Step_Passage(i,j) = DS_Passage_AvgStep(workspace_dim(i),workspace_dim(i),j);
        Avg_Step_LShaped(i,j) = DS_LShaped_AvgStep(workspace_dim(i),workspace_dim(i),j);
        Avg_Step_ZigZag(i,j) = DS_ZigZag_AvgStep(workspace_dim(i),workspace_dim(i),j);
        j
    end
end

ratio_Passage = zeros(length(workspace_dim),W);
ratio_LShaped = zeros(length(workspace_dim),W);
ratio_ZigZag = zeros(length(workspace_dim),W);

for i = 1:length(workspace_dim)
    for j = 1:W
        ratio_Passage(i,j) = Avg_Step_Passage(i,j)/(sqrt(2*((workspace_dim(i)-1)^2))*j);
        ratio_LShaped(i,j) = Avg_Step_LShaped(i,j)/((workspace_dim(i)^2)-(workspace_dim(i)-j)*(workspace_dim(i)-j));
        ratio_ZigZag(i,j) = Avg_Step_ZigZag(i,j)/(2*workspace_dim(i)*j);
        j
    end
end

figure

subplot(2,1,1)

plot(1:W,Avg_Step_Passage(1,:),'g')
xlabel('Width of the passage')
ylabel('Average steps')
%title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6')

hold on

plot(1:W,Avg_Step_LShaped(1,:),'r')
xlabel('Width of the passage')
ylabel('Average steps')
%title('initial=(1,1), final=(a-1,b-1), a*b=50*50, walk=300, cutoff=1e6')

hold on

plot(1:W,Avg_Step_ZigZag(1,:),'b')
xlabel('Width of the passage')
ylabel('Average steps')
%title('initial=(1,1), final=(a-1,b-1), a*b=50*50, walk=300, cutoff=1e6')

legend({'Passage','L-Shaped','ZigZag'},'Location','northeast');
title('initial=(1,1), final=(a-1,b-1), a*b=50*50, walk=300, cutoff=1e6')

hold off

subplot(2,1,2)

plot(1:W,ratio_Passage(1,:),'g')
xlabel('Width of the passage')
ylabel('Average steps')
title('initial=(1,1), final=(a-1,b-1), walk=300, cutoff=1e6')

hold on

plot(1:W,ratio_LShaped(1,:),'r')
xlabel('Width of the passage')
ylabel('Average steps/Enclosed area')
%title('initial=(1,1), final=(a-1,b-1), a*b=50*50, walk=300, cutoff=1e6')

hold on

plot(1:W,ratio_ZigZag(1,:),'b')
xlabel('Width of the passage')
ylabel('Average steps/Enclosed area')
%title('initial=(1,1), final=(a-1,b-1), a*b=50*50, walk=300, cutoff=1e6')


legend({'Passage','L-Shaped','ZigZag'},'Location','northeast');
title('initial=(1,1), final=(a-1,b-1), a*b=50*50, walk=300, cutoff=1e6')

hold off