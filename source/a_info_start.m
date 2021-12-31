clc
close all
scrsz = get(0,'ScreenSize');
figure( 'WindowStyle', 'normal', ...  %%%'normal'
                  'Visible'     ,'on', ...
                  'NumberTitle' ,'off', ...
                  'Name'        ,'Parameters', ...
                  'Resize'      ,'on', ...
                  'Colormap'    ,[], ...
                  'MenuBar'     ,'none',...
                  'ToolBar' 	,'none', ...
                 'OuterPosition',[scrsz(4)/2 scrsz(4)/5 scrsz(3)/1.6 scrsz(4)/1.61]);
plot(2000,800,'.w')
hold on
plot(1,1,'.w')
text(10,400,['\fontsize{12} Are the sample comparison parameters up to date ? ',...
 '\newline                                    ',...
 '\newline The directory of the first sample set is currently Sample A ORIG',...
 '\newline The directory of the second sample set is currently Sample B ORIG',...
 '\newline\newline The number of samples for the comparisons is currently NumSamp-A and NumSamp-B respectively ',...
 '\newline The number of re-sampling times Resampl-number (100)' ,...
 '\newline The size of one resample S-size (1000 points)',... 
 '\newline The max clustering radius Rmax (800 nm)',...
 ])



title ('\fontsize{16} PARAMETERS')
whitebg('w')
axis off
btn = uicontrol('Style', 'pushbutton', 'String', 'CLOSE',...
        'Position', [20 20 150 40],...
        'Callback','a_close_info');
clear('ax','btn','scrsz','options')

clc

