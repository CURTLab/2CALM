
figure(2000)
whitebg('w')
close figure 2000



scrsz = get(0,'ScreenSize');
figure ( 'WindowStyle', 'normal', ...  %%%'normal'
                  'Visible'     ,'on', ...
                  'NumberTitle' ,'off', ...
                  'Name'        ,'Sample Labels', ...
                  'Resize'      ,'on', ...
                  'Colormap'    ,[], ...
                  'MenuBar'     ,'none',...
                  'ToolBar' 	,'none', ...
                  'Position',[scrsz(3)/5 scrsz(4)/1.18 scrsz(4)/0.8 scrsz(4)/10.25]);
whitebg(get(gcf,'color'));
text(0.05,0.75,['The current MLP test is saved as Test Nr ',num2str(para_nr),' in the current directory of the first sample'],'Fontsize',12,'Fontweight','bold')
text(0.05,0.35,exname1,'Fontsize',12,'Fontweight','bold')
ax = gca;
ax.XColor = get(gcf,'color');
ax.YColor = get(gcf,'color');
xticklabels('0')
yticklabels('0')

btn = uicontrol('Style', 'pushbutton', 'String', 'Close',...
        'Position', [990 30 70 40],'Fontsize',10,...
        'Callback', 'close');

clear('ax','scrsz','btn')