clc
close all
scrsz = get(0,'ScreenSize');
figure( 'WindowStyle', 'normal', ...  %%%'normal'
                  'Visible'     ,'on', ...
                  'NumberTitle' ,'off', ...
                  'Name'        ,'Cluster size range', ...
                  'Resize'      ,'on', ...
                  'Colormap'    ,[], ...
                  'MenuBar'     ,'none',...
                  'ToolBar' 	,'none', ...
                 'OuterPosition',[scrsz(4)/5 scrsz(4)/3 scrsz(3)/1.5 scrsz(4)/1.61]);
plot(2000,800,'.w')
hold on
plot(0,1,'.w')
if exist('Rmax')==1
    zzr=num2str(Rmax);
else
    zzr='1000';
end
if exist('step_clustering')==1
    zzz=num2str(step_clustering);
else
    zzz='10';
end
   
text(5,630,['\fontsize{12} The current analyzed range of the clusters size is 5 nm to {\bf', zzr,'} nm (Rmax)',...
   ' with an increasing step of {\bf ',zzz,'} nm.',...
   '\newline Recommended maximum size of clusters Rmax = ',num2str(rtest),' nm',...
   '\newline \newline When changing the interval (Rmax) and clustering step, \newline {\it Bootstrap 3D-RIPLEY, Bootstrap DENSITY/CURVATURE and Bootstrap PRIMARY-CL DENSITY}\newline should be performed.'... 
   '\newline Previously stored results will be dimensionally inconsistent.  Will cause errors in drawings.' ])



title ('\fontsize{16}Cluster size range')
whitebg('w')
axis off
%btn = uicontrol('Style', 'pushbutton', 'String', 'CLOSE',...
       % 'Position', [20 20 150 40],...
       % 'Callback','a_close_info');
clear('ax','btn','scrsz','options')

clc

