
 
    if exist('dat1','var')==0 || exist('dat2','var')==0
      status=0;    
      xt=A_status(status,[],[]);    
    elseif isempty(dat1)==1 ||  isempty(dat2)==1 
       status=0;    
       xt=A_status(status,[],[]);   
    elseif exist('dat1or','var')==1 && exist('dat2or','var')==1
           if N1==N1or && N2==N2or
               if exist('status','var')==0  
               status=1;
               xt=A_status(status,dat1,dat2); 
               else
               xt=A_status(status,dat1,dat2); 
               end
           else
             if exist('status','var')==0  
             status=3;
              xt=A_status(status,dat1,dat2);
             else
              xt=A_status(status,dat1,dat2); 
             end
           end
    else
             if exist('status','var')==0  
             status=1;
              xt=A_status(status,dat1,dat2); 
             else
              xt=A_status(status,dat1,dat2); 
             end
    end
            
  
  
  
  
   
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
text(0.05,0.65,['Current data:   ',xt],'Fontsize',12,'Fontweight','bold')
ax = gca;
ax.XColor = get(gcf,'color');
ax.YColor = get(gcf,'color');
xticklabels('0')
yticklabels('0')

btn = uicontrol('Style', 'pushbutton', 'String', 'RESTORE',...
        'Position', [scrsz(3)*0.6 30 100 40],'Fontsize',10,...
        'Callback','A_stop_return');
    
if status==0
    a_info_load;
    A_start;
end
    

clear('ax','scrsz','btn','xt')


