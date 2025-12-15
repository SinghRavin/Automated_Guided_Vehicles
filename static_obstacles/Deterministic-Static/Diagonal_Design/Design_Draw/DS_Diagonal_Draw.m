
axes('XLim',[1,50], 'YLim',[1,50], 'XGrid','on', 'YGrid','on', 'XMinorGrid','on', 'YMinorGrid','on')

% set(gca,'xtick',[])
% set(gca,'ytick',[])
% set(gca,'visible','off')
set(gca,'XColor', 'none','YColor','none')

hold on

boundaries_x = [1:50,repelem(50,48),50:-1:1,repelem(1,48)];
boundaries_y = [repelem(1,50),2:49,repelem(50,50),49:-1:2];


plot(boundaries_x,boundaries_y,'k')

hold on

scatter(1,1,'*')

hold on

scatter(25,25,'*')

hold on

scatter(3:20,3:20)

legend({'Workspace boundaries','Initial position','Final position','18 Obstacles placed diagonally'},'Location','northeast');

