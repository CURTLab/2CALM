figure(2000)
whitebg('w')
close figure 2000


    if exist('dat1','var')==0 || exist('dat2','var')==0
      status=0;    
      a_info_load; 
      A_start;
      
    elseif isempty(dat1)==1 ||  isempty(dat2)==1 
      status=0;    
      a_info_load; 
      A_start;  
    end





if exist('dat2','var')==1

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
text(0.01,0.75,['Sample 1:   ',exname1,': ',num2str(N1),' points'],'Fontsize',12,'Fontweight','bold')
text(0.01,0.35,['Sample 2:   ',exname2,': ',num2str(N2),' points'],'Fontsize',12,'Fontweight','bold')
ax = gca;


ax.XColor = get(gcf,'color');
ax.YColor = get(gcf,'color');
xticklabels('0')
yticklabels('0')

btn = uicontrol('Style', 'pushbutton', 'String', 'Close',...
        'Position', [scrsz(4)/0.87 30 70 40],'Fontsize',10,...
        'Callback', 'close');
else
    clc
    disp(' ');
    disp('Sample 2 do not exists. Please load sample-2 data  ');
end
clear('ax','scrsz')