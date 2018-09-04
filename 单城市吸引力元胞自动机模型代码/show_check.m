function h = show_check(h,x,t)
[L,W] = size(x);
temp1 = zeros(L,L);
temp2 = temp1;
temp3 = temp1;
%% ���� ��ɫ 0 0 0   ״̬��d -1
temp1(x == -1) = 0;
temp2(x == -1) = 0;
temp3(x == -1) = 0;
%% ��ʼ״̬ ��ɫ 1 1 1 ״̬��c 0
temp1(x == 0) = 1;
temp2(x == 0) = 1;
temp3(x == 0) = 1;
%% ����Ȥ ��ɫ 1 1 0 ״̬��b 1 
temp1(x == 1) = 1;
temp2(x == 1) = 1;
temp3(x == 1) = 0;
%% ������ ��ɫ 1 0 0 ״̬��a 2
temp1(x == 2) = 1;
temp2(x == 2) = 0;
temp3(x == 2) = 0;

%% �ϲ�����
check = cat(3,temp1,temp2,temp3);

%% ��ͼ
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