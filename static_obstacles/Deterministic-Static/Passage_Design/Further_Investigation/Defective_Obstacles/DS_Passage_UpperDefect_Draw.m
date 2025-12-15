
axes('XLim',[1,50], 'YLim',[1,50], 'XGrid','on', 'YGrid','on', 'XMinorGrid','on', 'YMinorGrid','on')

set(gca,'XColor', 'none','YColor','none')

m = 15; % number of missing consecutive obstacles.

a=50; b=50;

O_x_5_left = [1:a-5];
O_y_5_left = [1+5:b];

O_x_5_right = [2+5:a];
O_y_5_right = [1:b-1-5];

O_x_5_Upper = [O_x_5_left(1:end-m),O_x_5_right];
O_y_5_Upper = [O_y_5_left(1:end-m),O_y_5_right];

hold on

boundaries_x = [1:50,repelem(50,48),50:-1:1,repelem(1,48)];
boundaries_y = [repelem(1,50),2:49,repelem(50,50),49:-1:2];

plot(boundaries_x,boundaries_y,'k')

hold on

scatter(1,1,'*')

hold on

scatter(a-1,b-1,'*')

hold on

scatter(O_x_5_Upper, O_y_5_Upper)

legend({'Workspace boundaries','Initial position','Final position','Obstacles region of W=5','Obstacles region of W=10'},'Location','northwest');