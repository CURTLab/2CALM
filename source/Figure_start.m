
load('Start_figure.mat')

scrsz = get(0,'ScreenSize');
figure ( 'WindowStyle', 'normal', ...  
                  'Visible'     ,'on', ...
                  'NumberTitle' ,'off', ...
                  'Name'        ,'2CALM V4.1', ...
                  'Resize'      ,'on', ...
                  'Colormap'    ,[], ...
                  'MenuBar'     ,'none',...
                  'ToolBar' 	,'none',...
                   'units',      'normalized',...
               'OuterPosition',[-0.005 0.0 1.1 1] ); 
whitebg('k');
xticklabels('0')
yticklabels('0')
subplot('Position',[0.1 0.1 0.85 0.85]);
imshow(T)
clear('scrsz','T')
clc