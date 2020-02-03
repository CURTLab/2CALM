scrsz = get(0,'ScreenSize');
figure('WindowStyle', 'normal', ...  %%%'normal'
                  'Visible'     ,'on', ...
                  'NumberTitle' ,'off', ...
                  'Name'        ,'MLP', ...
                  'Resize'      ,'on', ...
                  'Colormap'    ,[], ...
                  'MenuBar'     ,'none',...
                  'ToolBar' 	,'none', ...
                 'OuterPosition',[scrsz(3)/4 scrsz(4)/3 scrsz(3)/1.9 scrsz(4)/1.6]);
                 
whitebg('w')                 
text(0.05,0.9,' For proper network learning, bootstrapped cluster density/curvature and \newline Ripley K/H-function  tests  must be made before!',...
    'fontsize',12, 'color','b')

text(0.05,0.4,['\bf Current data can be used to increase neural network',...
     '\newline trainng data (Network retrain will be performed)',...
    '\newline button : UPDATE TRAINING DATA',...
     '\newline \newline or to create a new test from the current data \newline before classification test.',...
     '\newline button : NEW TEST DATA',...
     '\newline \newline or to retrain the network or to classification test',...
     '\newline button : RETRAIN OR TEST OR STOP',...
     '\newline \newline Please  wait'],...
     'fontsize',12, 'color','k')
%ax = gca;
%ax.XColor = 'blue';
%ax.YColor = 'blue';
%xticklabels('0')
%yticklabels('0')
whitebg('w')
axis off

title('MLP INFORMATION')
btn = uicontrol('Style', 'pushbutton', 'String', 'CLOSE',...
        'Position', [20 20 150 40],...
         'Callback', 'close');
clear('ax','btn')
