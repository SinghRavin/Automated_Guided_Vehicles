
axes('XLim',[1,50], 'YLim',[1,50], 'XGrid','on', 'YGrid','on', 'XMinorGrid','on', 'YMinorGrid','on')

set(gca,'XColor', 'none','YColor','none')

a=50; b=50;

O_x_5 = [1:a-5,2+5:a];
O_y_5 = [1+5:b,1:b-1-5];

O_x_10 = [1:a-10,2+10:a];
O_y_10 = [1+10:b,1:b-1-10];

hold on

boundaries_x = [1:50,repelem(50,48),50:-1:1,repelem(1,48)];
boundaries_y = [repelem(1,50),2:49,repelem(50,50),49:-1:2];

plot(boundaries_x,boundaries_y,'k')

hold on

scatter(1,1,'*')

hold on

scatter(a-1,b-1,'*')

hold on

scatter(O_x_5, O_y_5)

hold on

scatter(O_x_10, O_y_10)

legend({'Workspace boundaries','Initial position','Final position','Obstacles region of W=5','Obstacles region of W=10'},'Location','northwest');

