function h = show_check(h,x,t)
[L,W] = size(x);
temp1 = zeros(L,L);
temp2 = temp1;
temp3 = temp1;
%% 反感 黑色 0 0 0   状态：d -1
temp1(x == -1) = 0;
temp2(x == -1) = 0;
temp3(x == -1) = 0;
%% 初始状态 白色 1 1 1 状态：c 0
temp1(x == 0) = 1;
temp2(x == 0) = 1;
temp3(x == 0) = 1;
%% 感兴趣 黄色 1 1 0 状态：b 1 
temp1(x == 1) = 1;
temp2(x == 1) = 1;
temp3(x == 1) = 0;
%% 被吸引 红色 1 0 0 状态：a 2
temp1(x == 2) = 1;
temp2(x == 2) = 0;
temp3(x == 2) = 0;

%% 合并矩阵
check = cat(3,temp1,temp2,temp3);

%% 绘图
if ishandle(h)
    set(h,'CData',check)
    pause(t)
else
    figure(1)
    h = image(check);
    hold on 
    % plot([[0:W]',[0:W]']+0.5,[0,L]+0.5,'k')
    % plot([0,W]+0.5,[[0:L]',[0:L]']+0.5,'k')
    axis image
    set(gca,'xtick',[],'ytick',[]);
    pause(t)
end