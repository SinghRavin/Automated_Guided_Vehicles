
axes('XLim',[1,50], 'YLim',[1,50], 'XGrid','on', 'YGrid','on', 'XMinorGrid','on', 'YMinorGrid','on')

set(gca,'XColor', 'none','YColor','none')

a=50; b=50;

O_x_5 = [repelem(1,b),2:a,repelem(5+1,b-5),5+2:a];
O_y_5 = [1:b,repelem(b,a-1),1:b-5,repelem(b-5,a-5-1)];

O_x_10 = [repelem(1,b),2:a,repelem(10+1,b-10),10+2:a];
O_y_10 = [1:b,repelem(b,a-1),1:b-10,repelem(b-10,a-10-1)];

hold on

boundaries_x = [1:50,repelem(50,48),50:-1:1,repelem(1,48)];
boundaries_y = [repelem(1,50),2:49,repelem(50,50),49:-1:2];

plot(boundaries_x,boundaries_y,'k')

hold on

scatter(2,2,'*')

hold on

scatter(a-1,b-1,'*')

hold on

scatter(O_x_5, O_y_5,'X','r')

hold on

scatter(O_x_10, O_y_10,'c')

legend({'Workspace boundaries','Initial position','Final position','Obstacles region of W=5','Obstacles region of W=10'},'Location','southeast');

