
close all;

walks = 9600;
% W_max = 60;
widths = [13:21]; % different widths of obstacle region
workspace_dim = [125];
Avg_Step = zeros(length(workspace_dim),length(widths));

for i = 1:length(workspace_dim)
    for j = 1:length(widths)
        Avg_Step(i,j) = DS_Passage_AvgStep(workspace_dim(i),workspace_dim(i),widths(j),walks);
        j
    end
end

ratio = zeros(length(workspace_dim),length(widths));

for i = 1:length(workspace_dim)
    for j = 1:length(widths)
        ratio(i,j) = Avg_Step(i,j)/(sqrt(2*((workspace_dim(i)-1)^2))*widths(j));
    end
end

%figure

%plot(widths,Avg_Step(1,:),'g')
%xlabel('Width of the passage')
%ylabel('Average steps')

%hold on

%plot(widths,repelem(No_Obstacles_AvgStep(workspace_dim,workspace_dim),length(widths)))

table = rows2vars(array2table([widths;Avg_Step;repelem(No_Obstacles_AvgStep(workspace_dim,workspace_dim,walks),length(widths))],'RowNames',{'Width','Average Steps (with obstacles)','Average Steps (without obstacles)'}));
table;

% Plotting for walk = 9600 across each workspace size.

figure

y1 = [7327.1,7102.1,7040.2,7028.4,7016.1,7203.1,7290.4,7448.9,7829.2,7879.8,8020.3,8264.2,8445.4,8758.6,9059.6];
x1 = [7:20,22];

y2 = [19676,17656,16774,16377,16414,16258,16311,16556,16604,16972,17291,17568,17735,18281,18344,18984,19203,19336,19645];
x2 = [7:25];

y3 = [36098,32199,31247,30379,29587,29513,28854,29544,29406,29638,29754,30685,30706,31156,31052,31968,32557,33141];
x3 = [8:25];

y4 = [46854,45595,45054,46481,46043,45696,46119,46629,47117];
x4 = [13:21];

plot(x1,y1,'g')

hold on

plot(x2,y2,'r')

hold on

plot(x3,y3,'b')

hold on

plot(x4,y4,'k')

hold on

% Marking the otpimum width points.
plot([11,12,14,15],[7016.1,16258,28854,45054],'*')

hold off

xlabel('Width, W')
ylabel('Average steps')