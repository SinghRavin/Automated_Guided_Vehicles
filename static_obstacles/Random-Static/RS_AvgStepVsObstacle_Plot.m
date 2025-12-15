close all;

num = 10;
Avg_Step = zeros(1,num);
obstacles = zeros(1,num);

for i=1:num
    obstacles(i) = i^2;
end

for i = 1:num
    a = RS_AvgStep_and_D(i);
    Avg_Step(i) = a(1);
    i
end

figure
plot(obstacles,Avg_Step)
xlabel('number of static obstacles')
ylabel('success(average steps)')
%title('a=100, b=100, initial=(1,1), final(10,10), walk=50, cutoff=10e5')
