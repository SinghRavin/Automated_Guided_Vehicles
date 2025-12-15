
close all;

num = 10;
Avg_Step = zeros(1,num);
D = zeros(1,num);

for i = 1:num
    a = RS_AvgStep_and_D(i);
    Avg_Step(i) = a(1);
    D(i) = a(2);
    i
end

figure
plot(D,Avg_Step)
xlabel('D')
ylabel('success(average steps)')
%title('a=100, b=100, initial=(1,1), final(10,10), walk=50, cutoff=10e5')
