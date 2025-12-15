
axes('XLim',[1,50], 'YLim',[1,50], 'XGrid','on', 'YGrid','on', 'XMinorGrid','on', 'YMinorGrid','on')

set(gca,'XColor', 'none','YColor','none')

a=50; b=50; xf=a-2; yf=b-2;

% For W=5

O_left_x_5 = [repelem(1,5+1),2:5+1];
O_left_y_5 = [1:5+1,repelem(5+1,5)];
O_right_x_5 = 1:2*5+1;
O_right_y_5 = repelem(1,2*5+1);
    
k=floor(2*a/5); % number of stair like steps
    
for i=0:k
    O_left_x_5 = [O_left_x_5,repelem(O_left_x_5(end),2*5),O_left_x_5(end)+1:O_left_x_5(end)+2*5];
    O_left_y_5 = [O_left_y_5,O_left_y_5(end)+1:O_left_y_5(end)+2*5,repelem(O_left_y_5(end)+2*5,2*5)];
    O_right_x_5 = [O_right_x_5,repelem(O_right_x_5(end),2*5),O_right_x_5(end)+1:O_right_x_5(end)+2*5];
    O_right_y_5 = [O_right_y_5,O_right_y_5(end)+1:O_right_y_5(end)+2*5,repelem(O_right_y_5(end)+2*5,2*5)];
end
    
    %for i=1:(1+2*5+4*5*k)
        %if(O_left_x_5(i)==xf && O_left_y_5(i)==yf)
            %xf=xf+1; yf=yf-1;
        %end
        %if(O_right_x_5(i)==xf && O_right_y_5(i)==yf)
            %xf=xf-1; yf=yf+1;
        %end
    %end

O_x_5 = [O_left_x_5, O_right_x_5];
O_y_5 = [O_left_y_5,O_right_y_5];

% For W=10

O_left_x_10 = [repelem(1,10+1),2:10+1];
O_left_y_10 = [1:10+1,repelem(10+1,10)];
O_right_x_10 = 1:2*10+1;
O_right_y_10 = repelem(1,2*10+1);
    
    k=floor(2*a/10); % number of stair like steps
    
    for i=0:k
        O_left_x_10 = [O_left_x_10,repelem(O_left_x_10(end),2*10),O_left_x_10(end)+1:O_left_x_10(end)+2*10];
        O_left_y_10 = [O_left_y_10,O_left_y_10(end)+1:O_left_y_10(end)+2*10,repelem(O_left_y_10(end)+2*10,2*10)];
        O_right_x_10 = [O_right_x_10,repelem(O_right_x_10(end),2*10),O_right_x_10(end)+1:O_right_x_10(end)+2*10];
        O_right_y_10 = [O_right_y_10,O_right_y_10(end)+1:O_right_y_10(end)+2*10,repelem(O_right_y_10(end)+2*10,2*10)];
    end
    
    % Adjusting the final postion slightly in case the obstacle boundary
    % crossed through the final position.
    
    %for i=1:(1+2*10+4*10*k)
        %if(O_left_x_10(i)==xf && O_left_y_10(i)==yf)
            %xf=xf+1; yf=yf-1;
        %end
        %if(O_right_x_10(i)==xf && O_right_y_10(i)==yf)
            %xf=xf-1; yf=yf+1;
        %end
    %end

O_x_10 = [O_left_x_10, O_right_x_10];
O_y_10 = [O_left_y_10,O_right_y_10];
    
hold on

boundaries_x = [1:50,repelem(50,48),50:-1:1,repelem(1,48)];
boundaries_y = [repelem(1,50),2:49,repelem(50,50),49:-1:2];

plot(boundaries_x,boundaries_y,'k')

hold on

scatter(2,2,'*')

hold on

scatter(xf,yf,'*')

hold on

scatter(O_x_5, O_y_5,'X')

hold on

scatter(O_x_10, O_y_10)

legend({'Workspace boundaries','Initial position','Final position','Obstacles region of W=5','Obstacles region of W=10'},'Location','southeast');

